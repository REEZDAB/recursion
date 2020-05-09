program TSP;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

const
  start = 'a';
  ende = 'e';
  n = 6;

type
  ttab = array [1 .. 5, 1 .. 5] of integer;

const
  tab: ttab = ((0, 10, 65, 47, 33), (12, 0, 71, 52, 36), (65, 75, 0, 44, 50),
    (48, 52, 44, 0, 62), (33, 36, 50, 62, 0));

function checkWeg(s: string; m: integer): boolean;
var
  i, b, c, d, e: integer;
begin
  b := 0;
  c := 0;
  d := 0;
  e := 0;
  if (s[1] = 'a') and (s[m] = 'a') then
    for i := 2 to m - 1 do
      case s[i] of
        'b':
          inc(b);
        'c':
          inc(c);
        'd':
          inc(d);
        'e':
          inc(e);
      end;
  if (b = 1) and (c = 1) and (d = 1) and (e = 1) then
    checkWeg := true
  else
    checkWeg := false;
end;

procedure reku(s: string; ebene: byte; var wegString: string;
  var zeitSchnell: integer);
var
  i: char;
  j, von, zu, zeit: integer;
begin
  zeit := 0;
  if (ebene = n) then
  begin
    if checkWeg(s, n) then
    begin
      for j := 1 to n - 1 do
      begin
        von := ord(s[j]) - ord('`');
        zu := ord(s[j + 1]) - ord('`');
        zeit := zeit + tab[von][zu];
      end;
      // Dieser IF zweig darf nur einmal ausgeführt werden, und zwar beim erst gefundenem gültigen Weg.
      if zeitSchnell = 0 then
      begin
        zeitSchnell := zeit;
        wegString := s;
      end
      else if zeitSchnell > zeit then
      begin
        zeitSchnell := zeit;
        wegString := s;
      end;
    end;
  end
  else
    for i := start to ende do
    begin
      reku(s + i, ebene + 1, wegString, zeitSchnell)
    end;
end;

var
  wegString: string;
  zeitSchnell: integer;

begin
  wegString := '';
  zeitSchnell := 0;
  writeln('Carl van Vliet, Rekusion-Übung 2');
  reku('', 0, wegString, zeitSchnell);
  writeln('---');
  writeln('Schnellster Weg');
  writeln('WegString: ', wegString);
  writeln('Zeit in Min: ', zeitSchnell);
  writeln('---');
  readln

end.
