unit aMVCInterfaces;

interface

type
  TModelChangedEvent = procedure of object;

  IModel = interface
    ['{FDF18F94-0430-4C48-BE64-F4516C4C1011}']
    procedure Initialize;
    function GetOnModelChanged: TModelChangedEvent;
    procedure SetOnModelChanged(value: TModelChangedEvent);
    property OnModelChanged: TModelChangedEvent read GetOnModelChanged
      write SetOnModelChanged;
  end;

  IView = interface
    ['{A1F411E9-294D-444D-9D5B-1D6AC9988819}']
    procedure Initialize;
  end;

  IController = interface
    ['{E4BD8853-F6C8-4BD4-B19D-D70B156BD712}']
    procedure Initialize;
  end;

implementation

end.
