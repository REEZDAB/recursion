program Rekursion2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;


function fibo(n: word): word;
begin
  if n <= 2 then
    fibo := 1
  else
  begin
    fibo := fibo(n - 1) + fibo(n - 2);
  end;
end;


begin
  writeln(fibo(6));
  readln;

end.
