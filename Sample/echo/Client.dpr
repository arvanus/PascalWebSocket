program Client;

uses
  Vcl.Forms,
  main in 'main.pas' {FMain},
  WebSocket.Client in '..\..\src\WebSocket.Client.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
