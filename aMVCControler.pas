unit aMVCControler;

interface

uses aMCVModel, aMVCInterfaces, fMVCView;

type
  TFormController = class(TInterfacedObject, IController)
  private
    FView: TfrmMVCView;
    FModel: TModelMultiply;

  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    procedure Initialize;
    procedure Calc;
    class procedure NewInitialize;
  end;

implementation

{ TFormController }
procedure TFormController.Calc;
begin
  FModel.Multiply;
end;

constructor TFormController.Create;
begin
  FModel := TModelMultiply.Create;
  FView := TfrmMVCView.Create(nil);
end;

destructor TFormController.Destroy;
begin
  FView.Free;
  inherited;
end;

procedure TFormController.Initialize;
begin
  FView.Model := FModel;
  FModel.OnModelChanged := FView.ModelChanged;
  FView.DoCalc := Calc;
  FView.Initialize;
  FView.ShowModal;
end;

class procedure TFormController.NewInitialize;
begin
  with TFormController.Create do
  try
    Initialize;
  finally
    Free;
  end;
end;

end.
