program principal;
{$n+}
uses crt,graph,windos,mousem,dos;
type art=record
     cul,nume:string;
     x,y,z:integer;
end;
  const
  zile : array [0..6] of String[9] =
    ('dumninica','luni','marti',
     'miercuri','joi','vineri',
     'sambata');
var
    y, m, d, dow : Word;
    s:pathstr;
     f:file of art;
    X1x,Y1x,Z1x,tx,ty,tz,tx1,ty1,tz1:ARRAY [0..100] OF single;
    nume:array [1..100] of string;
    culoar:array [1..100] of ^byte;
    c:char;
    elem:art;
    x1,y1,z1:single;
    n:array [1..100] of integer;
    distantadata,dist:real;
    msg:array [1..6] of string;
    steaind,j,p,n1,i,gd,gm,ym:integer;
    gata1,gata:boolean;
    dista,dis,dis1,steasel:string;
    xmou,ymou,butmou:integer;
procedure contur;                     {cream conturul}
var ii:integer;
begin
for ii:=1 to 75 do
begin
textbackground(white);
gotoxy(ii,1);write(chr(177));
end;
for ii:=1 to 24 do
begin
textbackground(white);
gotoxy(1,ii);write(chr(177));
end;
for ii:=1 to 75 do
begin
textbackground(white);
gotoxy(ii,24);write(chr(177));
end;
for ii:=1 to 24 do
begin
textbackground(white);
gotoxy(75,ii);write(chr(177));
end;
end;
procedure distantas;
var k:integer;
begin
k:=0;
cleardevice;
for j:=1 to i do        {CALCULAM DISTANTA}
begin
     inc(k);
     dist:=sqrt(sqr(tx[j]-x1)+sqr(ty[j]-y1)+sqr(tz[j]-z1));
     if k<24 then
     begin
     outtextxy(20,K*20,'Distanta pana la');outtextxy(160,K*20,nume[j]);
     str(int(dist):1:2,dista);
     outtextxy(300,K*20,dista);
     if k=23 then
        outtextxy(400,450,'Continua')
     end
     else
         begin
         k:=0;
         c:=readkey;
         cleardevice;
         end;
end;
end;
procedure main;       {afiseaza interfata programului}
var ii :integer;
begin
textbackground(black);
clrscr;
contur;
textbackground(black);
ym:=0;
textbackground(red);
gotoxy(45,1);write(' Program miscare in spatiu');
textbackground(blue);
gotoxy(45,2);write(' Versiunea 1.2            ');
textbackground(red);
gotoxy(45,3);write(' Copywrite(c) Frincu Marc ');
textbackground(black);
textbackground(blue);
gotoxy(30,12);write('Alegeti optiunea');
textbackground(black);
gotoxy(25,14);write('Adaugare date');
gotoxy(25,15);write('Afisare date ');
gotoxy(25,16);write('Afisare harta');
gotoxy(25,17);write('Ajutor       ');
gotoxy(25,18);write('Noutati      ');
gotoxy(25,19);write('Iesire       ');
msg[1]:='Adaugare date';
msg[2]:='Afisare date ';
msg[3]:='Afisare harta';
msg[4]:='Ajutor       ';
msg[5]:='Noutati      ';
msg[6]:='Iesire       ';
textbackground(red);
gotoxy(25,14);write(msg[1]);
gotoxy(1,24);
textbackground(blue);
GetDate(y,m,d,dow);{afis data curenta}
Writeln('Data ', zile[dow],', ',m:0, '/', d:0, '/', y:0);
end;
procedure ajutor;                          {putin ajutor}
var ii :integer;
begin
textbackground(black);
clrscr;
contur;
textbackground(black);
textbackground(blue);
gotoxy(35,2);write('Cum sa ...');
gotoxy(8,3);write('Navigati pe optiuni');
textbackground(black);
gotoxy(5,4);write('Navigarea se face exclusiv din mouse. Pentru a activa ');
gotoxy(5,5);write('orice optiune este necesar sa efectuati un click pe ea');
textbackground(blue);
gotoxy(8,6);write('Iesiti fortat din listarea obiectelor pe ecran');
textbackground(black);
gotoxy(5,7);write('Pentru a iesi fortat apasati click oriunde pe ecran');
textbackground(blue);
gotoxy(8,8);write('Adaugati date:');
textbackground(black);
gotoxy(5,9);write('Cand accesati butonul calculatorul asteapta sa tastati ');
gotoxy(5,10);write('o tasta. Daca este Esc atunci revine la meniu, altfel ');
gotoxy(5,11);write('introduce date in fisier. Daca steaua exista va avertizeaza');
textbackground(blue);
gotoxy(8,12);write('Folositi harta:');
textbackground(black);
gotoxy(5,13);write('vedea harta.Pentru navigare folositi');
gotoxy(5,14);write('sagetile, respectiv stanga pentru rotatie pe Ox,      ');
gotoxy(5,15);write('sus pentru OY, dreapta pentru Oz. Pentru a vedea numele');
gotoxy(5,16);write('stelelor apasati tasta <=>, iar pentru a le face sa dispara');
gotoxy(5,17);write('tasta <->. Pentru a mari distanta de la stea apasati tasta <1>,');
gotoxy(5,18);write('iar pentru micsorare tasta <2>. Pentru Zoom in folositi tasta');
gotoxy(5,19);write('<i>, iar pentru Zoom out tasta <o>. In timpul rularii simularii');
gotoxy(5,20);write('puteti vizualiza distantele de la steaua selectata la toate');
gotoxy(5,21);write('stelele apasand <d>');
gotoxy(5,22);write('Pentru a schimba steaua selectata deplasati cursorul pe ');
gotoxy(5,23);write('ea si apasati tasta <s> de 2 ori');
readln;
main;
end;
procedure afisare; {afisam datele pe ecran}
var ii:integer;
begin
textbackground(black);
clrscr;
contur;
textbackground(black);
textbackground(blue);
gotoxy(5,2);write('nume stea');
gotoxy(25,2);write('coord x');
gotoxy(35,2);write('coord y');
gotoxy(45,2);write('coord z');
gotoxy(55,2);write('culoare');
writeln;
gotoxy(2,3);
write('------------------------------------------------------------');
writeln;
textbackground(black);
window(5,4,60,23);
reset(f);
while not eof(f) do
begin
if mousebutton=1 then
begin
break;
window(1,1,75,25);
main;
end
else
begin
read (f,elem);
write (elem.nume:16,elem.x:10,elem.y:10,elem.z:10,elem.cul:10);
writeln;
delay(8000);
end;
end;
close(f);
window(1,1,75,25);
main;
end;
procedure noutati; {ce este nou la aceasta versiune}
begin
window(2,2,40,15);
textbackground(magenta);
writeln('Versiunea 1.2 a programului aduce:               ');
writeln('1. O baza de date marita                         ');
write('2. Posibilitatea de a alege o stea care sa devina centrul');
write('axelor de coordonate. Operatiile ce se pot face cu aceasta stea');
write('sunt identice cu cele ce pot fi efectuate asupra Soarelui in');
write('versiunea 1.0. Adica aflarea stelelor dintr-o anumita distanta');
write('prin trasarea de linii, precum si aflarea distantelor de la steaua');
write('selectata la toate stelele din program     ');
window(1,1,75,25);
readln;
main;
end;
procedure fisier;       {citim datele din fisier}
begin
reset(f);
i:=0;
WHILE NOT EOF(F) DO
BEGIN
READ(F,ELEM);
INC(I);
nume[i]:=elem.nume;
tx[i]:=elem.x;
ty[i]:=elem.y;
tz[i]:=elem.z;
tx1[i]:=tx[i];
ty1[i]:=ty[i];
tz1[i]:=tz[i];
X1x[I]:=ELEM.X;
Y1x[I]:=ELEM.Y;
Z1x[I]:=ELEM.Z;
new(culoar[i]);
if elem.cul='o' then
   culoar[i]^:=1
else
    begin
    if elem.cul='a' then
       culoar[i]^:=0
    else
        begin
        if elem.cul='g' then
           culoar[i]^:=2
        else
        begin
             if elem.cul='k' then
             culoar[i]^:=3
        else
            culoar[i]^:=4;
        end;
    end;
end;
writeln(culoar[i]^);
if elem.nume='sol' then
   steaind:=i;
END;
close(f);
end;
{procedure axe;
begin
setcolor(green);
line(310,180,310,600);
line(310,180,310,0);
line(310,180,0,180);
line(310,180,800,180);
line(310,180,600,0);
line(310,180,0,400);
end;}
procedure distanta;
var j:integer;
begin
p:=0;
for j:=1 to i do        {CALCULAM DISTANTA}
begin
     dist:=sqrt(sqr(tx[j]-x1)+sqr(ty[j]-y1)+sqr(tz[j]-z1));
     if dist<=distantadata then
     begin
        inc(p);
        n[p]:=j;
     end;
end;
end;

procedure adaugare;               {adaugam date in fisier}
var ii,x,y,z,jj,jjj:integer;
nume,culoare:string;
raspuns :char;
sw,sw1:boolean;
begin
textbackground(black);
clrscr;
contur;
textbackground(black);
textbackground(blue);
gotoxy(10,10);write('dati numele stelei=            ');
gotoxy(10,11);write('dati coord x=    ');
gotoxy(10,12);write('dati coord y=    ');
gotoxy(10,13);write('dati coord z=    ');
gotoxy(10,14);write('dati culoarea= ');
gotoxy(29,10);
c:=readkey;
if c=#27 then
main
else
begin
gotoxy(29,10);readln(nume);
sw:=false;
reset(f);
sw1:=false;
while not eof(f) do
begin
read(f,elem);
             if elem.nume=nume then
                begin
                sw1:=true;
                window(30,10,70,20);
                textbackground(lightblue);
                for jj:=1 to 9 do
                    for jjj:=1 to 39 do
                    begin
                    gotoxy(jjj,jj);write(chr(176));
                    end;
                for jj:=2 to 40 do
                    begin
                    textbackground(white);
                    gotoxy(jj,10);
                    write(chr(176));
                    end;
                for jj:=2 to 10 do
                    begin
                    gotoxy(40,jj);
                    write(chr(176));
                    end;
                textbackground(red);
                gotoxy(5,5);write('Steaua exista. Suprascrieti?(d/n): ');
                gotoxy(39,5);
                readln(raspuns);
                if (raspuns='d') or (raspuns='D') then
                   sw:=true;
                end;

end;
close(f);
if sw1=false then
begin
window(1,1,75,25);
gotoxy(23,11);readln(x);
gotoxy(23,12);readln(y);
gotoxy(23,13);readln(z);
gotoxy(24,14);readln(culoare);
reset(f);
elem.nume:=nume;
elem.x:=x;
elem.y:=y;
elem.z:=z;
elem.cul:=culoare;
seek(f,filesize(f));
write(f,elem);
close(f);
end
else
if sw=true then
begin
window(1,1,75,25);
gotoxy(23,11);readln(x);
gotoxy(23,12);readln(y);
gotoxy(23,13);readln(z);
gotoxy(24,14);readln(culoare);
reset(f);
elem.nume:=nume;
elem.x:=x;
elem.y:=y;
elem.z:=z;
elem.cul:=culoare;
seek(f,filesize(f));
write(f,elem);
close(f);
main;
end
else
window(1,1,75,25);
main;
end;
end;
procedure harta;                                   {arata harta}
VAR kk,mm1,mm,test,ep,w,sx,sz,sy,X22,Y22,X11,Y11,U,X2,Y2,A,B,C,D:INTEGER;
    XP,YP:ARRAY [1..1000] OF integer;
    pas,k,ALFA3,XX,YY,ZZ,ALFA2,ALFA1:double;
    arataxe,name:boolean;
    c1:char;
    mx,my :string;
BEGIN
INITGRAPH(GD,GM,'c:\posi\progpers');
showmouse;
ALFA1:=0;
ALFA2:=0;
ALFA3:=0;
k:=1;
{cleardevice;}
p:=0;
distanta;
pAS:=10;
C:=-100;
B:=100;
A:=-100;
D:=100;
X11:=0;
Y11:=0;
X22:=620;
Y22:=120;
{afisam coordonatele imediat la incarcarea modului grafic}
{}
FOR J:=1 TO I DO    {TRANSFORMAM IN COORDONATE ECRAN}
BEGIN
     XP[J]:=ROUND((X1x[J]-A)*(X22-X11)/(B-A)+1/2);
     YP[J]:=Y22-ROUND((Y1x[J]-B)*(Y22-Y11)/(D-C)+1/2);
     if j=steaind then
     begin
        sx:=xp[j];
        sy:=yp[j];
        end;
END;
cleardevice;
setcolor(blue);
for J:=1 to I do     {afisam pe ecran punctele sau textele si liniile}
    BEGIN            {dupa culoarea spectrului}
    case culoar[j]^ of 0:
    begin
    setcolor(white);
        putpixel(xp[j],yp[j],white);
    end;
                   1:
    begin
    setcolor(blue);
        putpixel(xp[j],yp[j],blue);
    end;
                    2:
    begin
    setcolor(yellow);
        putpixel(xp[j],yp[j],yellow);
    end;
                    3:
    begin
    setcolor(lightred);
        putpixel(xp[j],yp[j],lightred);
    end;
                    4:
    begin
    setcolor(red);
        putpixel(xp[j],yp[j],red);
    end;
    end;
END;
{}
arataxe:=false;
REPEAT        {i=73,105 o=111,79}
BEGIN
C1:=READKEY;
clearDevice;
setcolor(blue);
str(distantadata:1:1,dis);
outtextxy(200,20,dis);
ALFA1:=0;
ALFA2:=0;
ALFA3:=0;
CASE C1 OF #100:{apasam d mic}begin
                        distantas;
                        readkey;
                        end;
           #49:{apasam tasta 1}
               begin
               distantadata:=distantadata+0.1;
               str(distantadata:1:1,dis);
               distanta;
               end;
           #50:
               begin
               if distantadata>1 then
               distantadata:=distantadata-0.1;
               str(distantadata:1:1,dis);
               distanta;
               end;
           #105: {apasam i mic}
               begin
               if k<4 then
               k:=k+0.3;
               FOR J:=1 TO I DO  {ROTIRE PE AXA OY}
                       BEGIN
                       xx:=x1x[j]*k;
                       yy:=y1x[j]*k;
                       zz:=z1x[j]*k;
                       X1x[J]:=XX;
                       Z1x[J]:=ZZ;
                       y1x[j]:=yy
                       end;
                       k:=1;
               end;
           #73:  {apasam i mare}
               begin
               if k<4 then
               k:=k+0.3
               end;
           #111:  {apasam o mic}
               begin
               if k>0.3   then
               k:=k-0.3;
               FOR J:=1 TO I DO  {ROTIRE PE AXA OY}
                       BEGIN
                       xx:=x1x[j]*k;
                       yy:=y1x[j]*k;
                       zz:=z1x[j]*k;
                       X1x[J]:=XX;
                       Z1x[J]:=ZZ;
                       y1x[j]:=yy
                       end;
                       k:=1;

               end;
           #79:  {apasam o mare}
               begin
               if k>0.3 then
               k:=k-0.3;
               end;
           #61: {APASAM TASTA +}
               begin
               name:=true;
               end;
           #45: {APASAM TASTA -}
               begin
               name:=false;
               end;
           #0:
               BEGIN
               C1:=READKEY;
               CASE C1 OF #72:  {APASAM SAGEATA IN SUS }
                       BEGIN
                       ALFA1:=PAS*pi/180;
                       FOR J:=1 TO I DO  {ROTIRE PE AXA OY}
                       BEGIN
                       XX:=((X1x[J]-0)*COS(ALFA1)-(Z1x[J]-0)*SIN(ALFA1)+0)*k;
                       ZZ:=((X1x[J]-0)*SIN(ALFA1)+(Z1x[J]-0)*COS(ALFA1)+0)*k;
                       X1x[J]:=XX;
                       Z1x[J]:=ZZ;
                       END;
                       k:=1;
                       END;
                           #75: {APASAM SAGEATA LA DREAPTA }
                       BEGIN
                       ALFA2:=PAS*PI/180;
                       FOR J:=1 TO I DO  {ROTIRE PE AXA OX}
                       BEGIN
                       ZZ:=((Z1x[J]-0)*COS(ALFA2)-(Y1x[J]-0)*SIN(ALFA2)+0)*k;
                       YY:=((Z1x[J]-0)*SIN(ALFA2)+(Y1x[J]-0)*COS(ALFA2)+0)*k;
                       Z1x[J]:=ZZ;
                       Y1x[J]:=YY;
                       END;
                       k:=1;
                       END;
                           #77: {APASAM SAGEATA LA STANGA}
                           BEGIN
                           ALFA3:=PAS*PI/180;
                           FOR J:=1 TO I DO   {ROTIRE PE AXA OZ}
                           BEGIN
                           YY:=((Y1x[J]-0)*COS(ALFA3)-(X1x[J]-0)*SIN(ALFA3)+0)*k;
                           XX:=((Y1x[J]-0)*SIN(ALFA3)+(X1x[J]-0)*COS(ALFA3)+0)*k;
                           X1x[J]:=XX;
                           Y1x[J]:=YY;
                           end;
                           k:=1;
                           end;
               END;
               END;
END;
FOR J:=1 TO I DO    {TRANSFORMAM IN COORDONATE ECRAN}
BEGIN
     XP[J]:=ROUND((X1x[J]-A)*(X22-X11)/(B-A)+1/2);
     YP[J]:=Y22-ROUND((Y1x[J]-B)*(Y22-Y11)/(D-C)+1/2);
     if j=steaind then
     begin
        sx:=xp[j];
        sy:=yp[j];
     end;
END;
cleardevice;
setcolor(blue);
outtextxy(20,20,'distanta de');
outtextxy(120,20,steasel);
outtextxy(250,20,dis);
for J:=1 to I do     {afisam pe ecran punctele sau textele si liniile}
    BEGIN            {dupa culoarea spectrului}
    case culoar[j]^ of 0:
    begin
    setcolor(white);
    if name=true then
       outtextxy(xp[J],yp[J],nume[j])
    else
        putpixel(xp[j],yp[j],white);
    end;
                    1:
    begin
    setcolor(blue);
    if name=true then
       outtextxy(xp[J],yp[J],nume[j])
    else
        putpixel(xp[j],yp[j],blue);
    end;
                    2:
    begin
    setcolor(yellow);
    if name=true then
       outtextxy(xp[J],yp[J],nume[j])
    else
        putpixel(xp[j],yp[j],yellow);
    end;
                    3:
    begin
    setcolor(lightred);
    if name=true then
       outtextxy(xp[J],yp[J],nume[j])
    else
        putpixel(xp[j],yp[j],lightred);
    end;
                    4:
    begin
    setcolor(red);
    if name=true then
       outtextxy(xp[J],yp[J],nume[j])
    else
        putpixel(xp[j],yp[j],red);
    end;
    end;
for w:=1 to p do
    if j=n[w] then
    begin
         setcolor(blue);
         line(sx,sy,xp[j],yp[j]);
    end;
END;
END;
{selectam o alta stea deplasand cursorul pe ea si apasand <s>}
mm:=i;
for kk:=1 to i do
    begin
    setcolor(red);
    if (mousex<=xp[kk]+10) and (mousex>=xp[kk]-10) and (mousey<=yp[kk]+10) and (mousey>=yp[kk]-10) and (readkey=#115) then
       begin
       textbackground(white);
       outtextxy(300,400,nume[kk]);
       {centram harta pe steaua selectata}
       for mm1:=1 to mm do
           begin
           x1x[mm1]:=tx[mm1]-tx[kk];
           y1x[mm1]:=ty[mm1]-ty[kk];
           z1x[mm1]:=tz[mm1]-tz[kk];
           end;
       x1:=tx[kk];
       y1:=ty[kk];
       z1:=tz[kk];
       steasel:=nume[kk];
       steaind:=kk;
       p:=0;
       end
       else;
    end;
UNTIL (C1=#27);
CLOSEGRAPH;
showmouse;
main;
end;
begin
clrscr;
X1:=0;
Y1:=0;
Z1:=0;
steasel:='sol';
distantadata:=4;
initmouse;
showmouse;
main;
ASSIGN(F,'DATA6.DAT');
{$i-}
RESET(F);
{$i+}
if ioresult<>0 then
   rewrite(f);
ym:=0;
gata1:=false;
repeat
begin
if ((mousex>=192) and (mousex<=232) and (mousey=144) and (mousebutton=1)) then
   begin
   gata1:=true;
   gotoxy(25,14+5);
   textbackground(black);
   write(msg[5+1]);
   gotoxy(25,14+5);
   textbackground(red);
   write(msg[5+1]);
   end
   else
       if ((mousex>=192) and (mousex<=232) and (mousey=128) and (mousebutton=1)) then
       begin
                 gotoxy(25,14+3);
                 textbackground(black);
                 write(msg[3+1]);
                 gotoxy(25,14+3);
                 textbackground(red);
                 write(msg[3+1]);
       delay(1000);
       ajutor;
       end
       else
       if ((mousex>=192) and (mousex<=288) and (mousey=120) and (mousebutton=1)) then
       begin
                 gotoxy(25,14+2);
                 textbackground(black);
                 write(msg[2+1]);
                 gotoxy(25,14+2);
                 textbackground(red);
                 write(msg[2+1]);
       delay(1000);
       fisier;
       X1:=0;
       Y1:=0;
       Z1:=0;
       steasel:='Soare';
       distantadata:=4;
       harta;
       end
       else
       if ((mousex>=192) and (mousex<=280) and (mousey=112) and (mousebutton=1)) then
       begin
                 gotoxy(25,14+1);
                 textbackground(black);
                 write(msg[1+1]);
                 gotoxy(25,14+1);
                 textbackground(red);
                 write(msg[1+1]);
       delay(1000);
       afisare;
       end
       else
       if ((mousex>=192) and (mousex<=288) and (mousey=104) and (mousebutton=1)) then
       begin
                 gotoxy(25,14+0);
                 textbackground(black);
                 write(msg[0+1]);
                 gotoxy(25,14+0);
                 textbackground(red);
                 write(msg[0+1]);
       delay(1000);
       adaugare;
       end
       else
       if ((mousex>=192) and (mousex<=240) and (mousey=136) and (mousebutton=1)) then
       begin
             gotoxy(25,14+4);
             textbackground(black);
             write(msg[4+1]);
             gotoxy(25,14+4);
             textbackground(red);
             write(msg[4+1]);
             noutati;
       end;
end;
until {gata}  gata1;
end.