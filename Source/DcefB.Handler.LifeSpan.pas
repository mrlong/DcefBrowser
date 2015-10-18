(*
  Delphi Multi-tab Chromium Browser Frame

  Unit owner : BccSafe
  QQ: 1262807955
  Email: bccsafe5988@gmail.com
  Web site   : http://www.bccsafe.com
  Repository : https://github.com/bccsafe/DcefBrowser
*)

unit DcefB.Handler.LifeSpan;

interface

uses
  Winapi.Windows, System.Classes,
  DcefB.Dcef3.CefLib, DcefB.Events, DcefB.res, DcefB.Utils, DcefB.BaseObject;

type
  TDcefBLifeSpanHandler = class(TCefLifeSpanHandlerOwn)
  private
    FEvents: IDcefBEvents;
  protected
    function OnBeforePopup(const browser: ICefBrowser; const frame: ICefFrame;
      const targetUrl, targetFrameName: ustring;
      var popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo;
      var client: ICefClient; var settings: TCefBrowserSettings;
      var noJavascriptAccess: Boolean): Boolean; override;
    procedure OnAfterCreated(const browser: ICefBrowser); override;
    procedure OnBeforeClose(const browser: ICefBrowser); override;
    function RunModal(const browser: ICefBrowser): Boolean; override;
    function DoClose(const browser: ICefBrowser): Boolean; override;
  public
    constructor Create(aDcefBEvents: IDcefBEvents); reintroduce;
    destructor Destroy; override;
  end;

implementation

{ TCustomLifeSpanHandler }

constructor TDcefBLifeSpanHandler.Create(aDcefBEvents: IDcefBEvents);
begin
  inherited Create;
  FEvents := aDcefBEvents;
end;

destructor TDcefBLifeSpanHandler.Destroy;
begin
  FEvents := nil;
  inherited;
end;

function TDcefBLifeSpanHandler.DoClose(const browser: ICefBrowser): Boolean;
begin
  Result := False;
  TDcefBUtils.SendMsg(browser, WM_DoClose, LParam(@Result));
end;

procedure TDcefBLifeSpanHandler.OnAfterCreated(const browser: ICefBrowser);
begin
  inherited;
  TDcefBUtils.SendMsg(browser, WM_NewBrowser, LParam(browser.Identifier));
end;

procedure TDcefBLifeSpanHandler.OnBeforeClose(const browser: ICefBrowser);
begin
  inherited;
  TDcefBUtils.SendMsg(browser, WM_BeforeClose, 0);
end;

function TDcefBLifeSpanHandler.OnBeforePopup(const browser: ICefBrowser;
  const frame: ICefFrame; const targetUrl, targetFrameName: ustring;
  var popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo;
  var client: ICefClient; var settings: TCefBrowserSettings;
  var noJavascriptAccess: Boolean): Boolean;
var
  PArgs: PBeforePopupArgs;
begin
  new(PArgs);
  PArgs.popupFeatures := @popupFeatures;
  PArgs.windowInfo := @windowInfo;

  if Not TDcefBUtils.SendMsg(browser, WM_WindowCheck, LParam(PArgs)) then
  begin
    Result := True;
    Dispose(PArgs);
    Exit;
  end;

  if Not TDcefBUtils.SendMsg(browser, WM_CreateWindow, LParam(PArgs)) then
  begin
    Result := True;
    Exit;
  end;
  Dispose(PArgs);
  Result := False;
end;

function TDcefBLifeSpanHandler.RunModal(const browser: ICefBrowser): Boolean;
begin
  Result := False;
  TDcefBUtils.SendMsg(browser, WM_RunModal, LParam(@Result));
end;

end.