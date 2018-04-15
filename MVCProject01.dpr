program MVCProject01;

uses
  Vcl.Forms,
  fApp in 'fApp.pas' {frmApp},
  aMVCInterfaces in 'aMVCInterfaces.pas',
  aMCVModel in 'aMCVModel.pas',
  fMVCView in 'fMVCView.pas' {frmMVCView},
  aMVCControler in 'aMVCControler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmApp, frmApp);
  Application.CreateForm(TfrmMVCView, frmMVCView);
  Application.Run;
end.
