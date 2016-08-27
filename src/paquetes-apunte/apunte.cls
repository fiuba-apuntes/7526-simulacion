%% apunte.cls
%% V1
%% 2016/08/27
%% por FIUBA Apuntes
%% http://fiuba-apuntes.github.io/
%%
%% Esta es la clase a usar para los documentos de FIUBA Apuntes.
%%
%% Licencia Creative Commons Atribución-NoComercial-CompartirIgual 4.0
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apunte}[2016/08/27 Apunte]

%%---------------------------------- Options -----------------------------------

%\DeclareOption{10pt}{
%  \PassOptionsToClass{\CurrentOption}{article}
%}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}

%%---------------------------------- Fallback ----------------------------------

%\DeclareOption*{
%  \ClassWarning{apunte}{Unknown option '\CurrentOption'}
%}

%%-------------------------- Execute default options ---------------------------

\ExecuteOptions{10pt}

%%--------------------------- Process given options ----------------------------

\ProcessOptions\relax

%%---------------------------------- Commands ----------------------------------

\newcommand*{\nombremateria}[1]{\gdef\@nombremateria{#1}}
%\DeclareRobustCommand{\nombremateria}[1][ ]{%
%  \ifmmode
%  #1%
%  \else
%  \ClassWarning{apunte}{No se asigno \protect\nombremateria\space}%
%  \fi
%}

%%--------------------------------- Load base ----------------------------------

\LoadClassWithOptions{article}

%%------------------- Load additional packages and commands --------------------

%% *** geometry ***
%% Márgenes personalizados

\RequirePackage[top=3cm, bottom=2.5cm, inner=1.5cm, outer=2.5cm]{geometry}

%% *** fancyhdr ***

\RequirePackage{lastpage} % Permite contabilizar el total de páginas del documento.
\RequirePackage{fancyhdr} % Permite personalizar los header y footer del documento.

% Define el pagestyle personalizado
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\sectionmark}[1]{\markboth{}{\thesection\ \ #1}}
% Define header para pagina par
\fancyhead[ER]{\rightmark}
% Define header para pagina impar
\fancyhead[OL]{\rightmark}
% Define footer para pagina par
\fancyfoot[EL]{\@nombremateria} % Nombre del apunte a la izquierda
\fancyfoot[ER]{Página \thepage\ de \pageref{LastPage}} % Numero de pagina a la derecha
% Define footer para pagina impar
\fancyfoot[OL]{Página \thepage\ de \pageref{LastPage}} % Numero de pagina a la izquierda
\fancyfoot[OR]{\@nombremateria} % Nombre del apunte a la derecha

\renewcommand{\footrulewidth}{0.4pt} % Agrego linea que separa el footer

%% *** xcolor ***

\RequirePackage{xcolor} % Permite utilizar más colores.

%% *** hyperref ***

\RequirePackage{hyperref} % Permite incluir enlaces en los archivos.
% Define los estilos de los enlaces interpretados por el paquete hyperref
\hypersetup{
  colorlinks=true,   % false: boxed links; true: colored links
  linkcolor=black,   % color of internal links (change box color with linkbordercolor)
  citecolor=green,   % color of links to bibliography
  filecolor=magenta, % color of file links
  urlcolor=blue     % color of external links
}

%%------------------------- Additional TeX/LaTeX code --------------------------

\endinput
