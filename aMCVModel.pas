unit aMCVModel;

interface

uses
  aMVCInterfaces;


type
  TModelMultiply = class(TInterfacedObject, IModel)
  private
    FValue1: integer;
    FValue2: integer;
    FOnModelChanged: TModelChangedEvent;
    FSolution: integer;
    procedure SetValue1(const Value: integer);
    procedure SetValue2(const Value: integer);
    function GetOnModelChanged: TModelChangedEvent;
    procedure SetOnModelChanged(Value:

      TModelChangedEvent);
    procedure Initialize;
    procedure SetSolution(const Value: integer);
  public
    constructor Create; reintroduce;
    function Multiply: integer;
    property Value1: integer read FValue1 write SetValue1;
    property Value2: integer read FValue2 write SetValue2;
    property Solution: integer read FSolution write SetSolution;
    property OnModelChanged: TModelChangedEvent read GetOnModelChanged
      write SetOnModelChanged;
  end;

implementation

{ TModelMultiply }
constructor TModelMultiply.Create;
begin
  Initialize;
end;

function TModelMultiply.GetOnModelChanged: TModelChangedEvent;
begin
  result := FOnModelChanged;
end;

procedure TModelMultiply.Initialize;
begin
  Value1 := 0;
  Value2 := 0;
  Solution := 0;
end;

function TModelMultiply.Multiply: integer;
begin
  result := Value1 * Value2;
  Solution := result;
  if Assigned(OnModelChanged) then
    OnModelChanged;
end;

procedure TModelMultiply.SetOnModelChanged(Value: TModelChangedEvent);
begin
  FOnModelChanged := Value;
end;

procedure TModelMultiply.SetSolution(const Value: integer);
begin
  FSolution := Value;
end;

procedure TModelMultiply.SetValue1(const Value: integer);
begin
  FValue1 := Value;
end;

procedure TModelMultiply.SetValue2(const Value: integer);
begin
  FValue2 := Value;
end;

end.
