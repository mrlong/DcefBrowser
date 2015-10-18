(*
  Delphi Multi-tab Chromium Browser Frame

  Unit owner : BccSafe
  QQ: 1262807955
  Email: bccsafe5988@gmail.com
  Web site   : http://www.bccsafe.com
  Repository : https://github.com/bccsafe/DcefBrowser
*)

unit DcefB.res;

interface

uses
  Winapi.Messages;

Const
  WM_LoadingStateChange = WM_USER + 1;
  WM_WindowCheck = WM_USER + 2;
  WM_CreateWindow = WM_USER + 3;
  WM_NewBrowser = WM_USER + 4;
  WM_LoadStart = WM_USER + 5;
  WM_LoadEnd = WM_USER + 6;
  WM_LoadError = WM_USER + 7;
  WM_SetActive = WM_USER + 8;
  WM_GotFocus = WM_USER + 9;
  WM_SetFocus = WM_USER + 10;
  WM_TakeFocus = WM_USER + 11;
  WM_BeforeContextMenu = WM_USER + 12;
  WM_ContextMenuCommand = WM_USER + 13;
  WM_ContextMenuDismissed = WM_USER + 14;
  WM_FileDialog = WM_USER + 15;
  WM_KeyEvent = WM_USER + 16;
  WM_PreKeyEvent = WM_USER + 17;
  WM_AddressChange = WM_USER + 18;
  WM_ConsoleMessage = WM_USER + 19;
  WM_StatusMessage = WM_USER + 20;
  WM_TitleChange = WM_USER + 21;
  WM_Tooltip = WM_USER + 22;
  WM_BeforeDownload = WM_USER + 23;
  WM_DownloadUpdated = WM_USER + 24;
  WM_RequestGeolocationPermission = WM_USER + 25;
  WM_CancelGeolocationPermission = WM_USER + 26;
  WM_Jsdialog = WM_USER + 27;
  WM_BeforeUnloadDialog = WM_USER + 28;
  WM_ResetDialogState = WM_USER + 29;
  WM_DialogClosed = WM_USER + 30;
  WM_DoClose = WM_USER + 31;
  WM_BeforeClose = WM_USER + 32;
  WM_RunModal = WM_USER + 33;

  WM_BeforeBrowse = WM_USER + 34;
  WM_BeforeResourceLoad = WM_USER + 35;
  WM_GetResourceHandler = WM_USER + 36;
  WM_ResourceRedirect = WM_USER + 37;
  WM_AuthCredentials = WM_USER + 38;
  WM_QuotaRequest = WM_USER + 39;
  WM_ProtocolExecution = WM_USER + 40;
  WM_BeforePluginLoad = WM_USER + 41;
  WM_CertificateError = WM_USER + 42;
  WM_PluginCrashed = WM_USER + 43;
  WM_RenderProcessTerminated = WM_USER + 44;
  WM_DragEnter = WM_USER + 45;

  WM_DevTools = WM_USER + 46;
  WM_RefreshIgnoreCache = WM_USER + 47;
  WM_SearchText = WM_USER + 48;

  State_IsLoading = $001;
  State_CanGoBack = $002;
  State_CanGoForward = $004;

Const
  SBlankPageUrl = 'about:blank';
  SLoadingText = '���ڼ���';
  SNoTitleText = '�ޱ���';
  SDialogTitleSuffix = ' �ϵ���ҳ��ʾ';
  SUnloadDialogTitle = 'ȷ�ϵ���';
  SUnloadDialogText = 'ȷ��Ҫ�뿪��ҳ��';
  SRunOnlyInSinglePro = '��ʱֻ֧�ֵ�����ģʽ';

implementation

end.