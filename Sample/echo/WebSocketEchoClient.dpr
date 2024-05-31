program WebSocketEchoClient;

uses
  Vcl.Forms,
  Unit1 in '..\..\..\WebSocket\Unit1.pas' {Form1},
  WebSocket.Client in '..\..\src\WebSocket.Client.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
