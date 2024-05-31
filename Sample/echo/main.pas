unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebSocket.Client, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TFMain = class(TForm)
    Memo1: TMemo;
    edServer: TLabeledEdit;
    ButtonDisConnect: TButton;
    edMessage: TLabeledEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonDisConnectClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure lSWC1DataEvent(Sender: TObject; const Text: string);
    var lSWC:TIdSimpleWebSocketClient;
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

{ TFMain }

procedure TFMain.ButtonDisConnectClick(Sender: TObject);
begin
  if ButtonDisConnect.Caption='Connect' then
  begin
    lSWC.Connect(edServer.Text);
    ButtonDisConnect.Caption:='Disconnect';
  end
  else
  begin
    lSWC.Close;
    ButtonDisConnect.Caption:='Connect';
  end;
end;

procedure TFMain.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add('Sent: '+edMessage.Text);
  lSWC.writeText(edMessage.Text);
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if lSWC.Connected then
    lSWC.Close;
  lSWC.Free;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  lSWC := TIdSimpleWebSocketClient.Create(self);
  lSWC.onDataEvent           := self.lSWC1DataEvent;  //TSWSCDataEvent
  lSWC.AutoCreateHandler := false; //you can set this as true in the majority of Websockets with ssl
  if not lSWC.AutoCreateHandler then
  begin
    if lSWC.IOHandler=nil then
      lSWC.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(lSWC);
    (lSWC.IOHandler as TIdSSLIOHandlerSocketOpenSSL).SSLOptions.Mode := TIdSSLMode.sslmClient;
    (lSWC.IOHandler as TIdSSLIOHandlerSocketOpenSSL).SSLOptions.SSLVersions := [TIdSSLVersion.sslvTLSv1, TIdSSLVersion.sslvTLSv1_1, TIdSSLVersion.sslvTLSv1_2];
    (lSWC.IOHandler as TIdSSLIOHandlerSocketOpenSSL).PassThrough := False;
  end;
end;

procedure TFMain.lSWC1DataEvent(Sender: TObject; const Text: string);
begin
  Memo1.Lines.Add('Received: '+text);
end;

end.
