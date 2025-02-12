unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



const
  xmax = 30;
  ymax = 30;
  xx:array[1..8]of Integer=(-1,0,1,1,1,0,-1,-1);
  yy:array[1..8]of Integer=(-1,-1,-1,0,1,1,1,0);
var
  Form3: TForm3;
  a:array[1..xmax,1..ymax]of TSpeedButton;
  map,mapo,mapoo:array[1..xmax,1..ymax]of boolean;
  time:longint= 0;
  flag:Boolean = true;
  ffflag:Boolean;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var i,j,temp:Integer;
begin
  time:=0;
  flag:=True;
  ffflag:=True;
  for i:= 1 to xmax do
    for j:=1 to ymax do
      begin
        a[i,j].Enabled:=True;
        temp:=Random(3);
        if temp<=1 then
          a[i,j].Enabled:=False;

      end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if Timer1.Enabled then begin  timer1.Enabled:=False; Button2.Caption:='继续续'; end
                    else begin  timer1.Enabled:=True; Button2.Caption:='停一会再续'; end
end;

procedure TForm3.FormCreate(Sender: TObject);
var i,j:longint;
    temp:LongInt;
begin
  ffflag:=True;
  flag:=True;
  Randomize;
  for i:= 1 to xmax do
    for j:=1 to ymax do
      begin
        temp:=Random(3);
        a[i,j]:=TspeedButton.Create(Self);
        with a[i,j] do
          begin
            Parent  :=self;
            Caption :='';
            Width   :=13;
            Height  :=13;
            Top	    :=11*(i-1)+35;
            Left    :=((j-1)*11)+15;
            Tag     :=0;
            ShowHint:=True;
            Hint    :='('+inttostr(i)+','+inttostr(j)+')';
            if temp<=1 then
              Enabled:=false;
          end;
      end;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
var
  I: Integer;
  j: Integer;
  count:longint;
  k,x,y: Integer;

  function stop:Boolean;
  var i,j:longint;
  begin
    for I := 1 to xmax do
      for j := 1 to ymax do
        if mapoo[i,j]<>map[i,j] then
          begin
            stop:=False;
            Exit;
          end;
    stop:=True;
  end;
begin
  if (stop)and(time<>0) then
  begin
    flag:=false;
    if ffflag=True then
    begin
      ffflag:=false;
      ShowMessage('你续了'+inttostr(time)+'s,感谢你的贡献！');
    end;
  end;
  for I := 1 to xmax do
    for j := 2 to ymax do
      mapoo[i,j]:=mapo[i,j];
  for I := 1 to xmax do
    for j := 2 to ymax do
      mapo[i,j]:=a[i,j].Enabled;
  for I := 1 to xmax do
    for j := 1 to ymax do
      begin
        count:=0;
        for k := 1 to 8 do
        begin
          x:=i+xx[k];
          y:=j+yy[k];
          if (x>0)and(y>0)and(x<xmax+1)and(y<ymax+1) then
            if (mapo[x,y]) then
              Inc(count);
        end;
        if count=3 then begin a[i,j].Enabled:=True; Continue; end;
        if (count>3)or(count<2) then begin a[i,j].Enabled:=False; Continue; end;
      end;
  for I := 1 to xmax do
    for j := 2 to ymax do
      map[i,j]:=a[i,j].Enabled;
  if flag then
  begin
    Inc(time);
    label1.Caption:='已续'+IntToStr(time)+'s';
    if time>=1000 then
      begin
        Timer1.Enabled:=false;
        ShowMessage('恭喜您发现了远古蛤钦定的续命宝典，请找作者领取续命奖励！');
      end;
  end;
end;

procedure TForm3.TrackBar1Change(Sender: TObject);
begin
  Timer1.Interval := TrackBar1.Position;
end;

end.
