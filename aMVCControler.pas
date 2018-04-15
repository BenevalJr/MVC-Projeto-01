unit aMVCControler;

interface

uses aMCVModel, aMVCInterfaces, fMVCView;

type
  TFormController = class(TInterfacedObject, IController)
  private
    FView: TfrmMVCView;
    FModelMultiply: TModelMultiply;
    FModelDivide: TModelDivide;

  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    procedure Initialize;
    procedure Multiply;
    procedure Divide;
    class procedure NewInitialize;
  end;

implementation

{ TFormController }

constructor TFormController.Create;
begin
  FModelMultiply := TModelMultiply.Create;
  FModelDivide   := TModelDivide.Create;
  FView := TfrmMVCView.Create(nil);
end;

destructor TFormController.Destroy;
begin
  FView.Free;
  inherited;
end;

procedure TFormController.Divide;
begin
  FModelDivide.Divide;
end;

procedure TFormController.Initialize;
begin
  FView.Model := FModel;
  FModel.OnModelChanged := FView.ModelChanged;
  FView.DoCalc := Calc;
  FView.Initialize;
  FView.ShowModal;
end;

procedure TFormController.Multiply;
begin
  FModelMultiply.Multiply;
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
