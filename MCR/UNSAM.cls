\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UNSAM}[]

\LoadClass[12pt,openany]{report}

% Paquetes esenciales
\RequirePackage{emptypage}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsfonts}
\RequirePackage{xfrac}
\RequirePackage[table]{xcolor}
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{indentfirst}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{geometry}
\RequirePackage[main=spanish, provide=*]{babel}
\RequirePackage{hyperref}
\RequirePackage{eso-pic}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{wrapfig}
\RequirePackage{pdflscape}
\RequirePackage{pgfgantt}
\RequirePackage{biblatex}
\RequirePackage[toc]{glossaries}
\RequirePackage{caption}
\RequirePackage{pgfplots}
\RequirePackage{circuitikz}
\RequirePackage{multirow}
\RequirePackage{pdfpages}
\RequirePackage{forest}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\setstretch{1.15}

% configuracion de hipervinculos
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

% Márgenes y geometría
\geometry{
  a4paper,
  left=2.5cm, right=2.5cm,
  top=0.5cm, bottom=2cm, headheight=2cm, headsep=1cm,
  nomarginpar, includehead
}
% Encabezados y pies de página

\newcommand{\setCustomPageStyle}{
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[L]{
          \includegraphics[height=1cm]{cls/Logo_UNSAM.png}
      }
  \fancyhead[C]{
    \textbf{\@titulo}\\
    \@subtitulo
  }
  \fancyfoot[C]{Página \thepage\ de \pageref{LastPage}}
  \renewcommand{\headrulewidth}{0pt}
}
\setCustomPageStyle

% Comandos personalizados
\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\@subtitulo}{}  % Inicialmente vacío
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}
\newcommand{\grupo}[1]{\def\@grupo{#1}}
\newcommand{\fecha}[1]{\def\@fecha{#1}}
\newcommand{\docn}[1]{\def\@docn{#1}}

% Para sistema de archivos
\definecolor{folderbg}{RGB}{124,166,198}
\definecolor{folderborder}{RGB}{110,144,169}

\def\Size{4pt}
\tikzset{
  folder/.pic={
    \filldraw[draw=folderborder,top color=folderbg!50,bottom color=folderbg]
      (-1.05*\Size,0.2\Size+5pt) rectangle ++(.75*\Size,-0.2\Size-5pt);
    \filldraw[draw=folderborder,top color=folderbg!50,bottom color=folderbg]
      (-1.15*\Size,-\Size) rectangle (1.15*\Size,\Size);
  }
}

\forestset{
  folder node/.style={
    edge path={
      \noexpand\path [draw, \forestoption{edge}]
      (!u.south west) +(7.5pt,0) |- (.child anchor) pic {folder} \forestoption{edge label};
    }
  },
  file node/.style={
    edge path={
      \noexpand\path [draw, \forestoption{edge}]
      (!u.south west) +(7.5pt,0) |- (.child anchor) \forestoption{edge label};
    }
  }
}

% UNIDADES UTILES
% --- Resistencias ---
\newcommand{\ohm}{\,\Omega}
\newcommand{\kohm}{\,\mathrm{k}\Omega}
\newcommand{\Mohm}{\,\mathrm{M}\Omega}

% --- Capacitancias ---
\newcommand{\nF}{\,\mathrm{nF}}
\newcommand{\uF}{\,\mathrm{\mu F}}
\newcommand{\mF}{\,\mathrm{mF}}
\newcommand{\F}{\,\mathrm{F}}

% --- Tensión ---
\newcommand{\uV}{\,\mathrm{\mu V}}
\newcommand{\mV}{\,\mathrm{mV}}
\newcommand{\V}{\,\mathrm{V}}
\newcommand{\kV}{\,\mathrm{kV}}

% --- Corriente ---
\newcommand{\uA}{\,\mathrm{\mu A}}
\newcommand{\mA}{\,\mathrm{mA}}
\newcommand{\A}{\,\mathrm{A}}

% --- Inductancias ---
\newcommand{\mH}{\,\mathrm{mH}}
\newcommand{\uH}{\,\mathrm{\mu H}}
\newcommand{\nH}{\,\mathrm{nH}}

% --- Frecuencia ---
\newcommand{\Hz}{\,\mathrm{Hz}}

% --- Potencia ---
\newcommand{\W}{\,\mathrm{W}}       % Watt
\newcommand{\mW}{\,\mathrm{mW}}     % miliWatt
\newcommand{\kW}{\,\mathrm{kW}}     % kiloWatt

% --- Energía ---
\newcommand{\J}{\,\mathrm{J}}       % Joule
\newcommand{\mJ}{\,\mathrm{mJ}}     % miliJoule
\newcommand{\kJ}{\,\mathrm{kJ}}     % kiloJoule
\newcommand{\Wh}{\,\mathrm{Wh}}     % Watt-hora
\newcommand{\kWh}{\,\mathrm{kWh}}   % kiloWatt-hora

% --- Temperatura ---
\newcommand{\Celsius}{\,^\circ\mathrm{C}}    % Grados Celsius
\newcommand{\Kelvin}{\,\mathrm{K}}           % Kelvin

% --- Tiempo ---
\newcommand{\s}{\,\mathrm{s}}
\newcommand{\ms}{\,\mathrm{ms}}              % milisegundos
\newcommand{\us}{\,\mathrm{\mu s}}           % microsegundos
\newcommand{\ns}{\,\mathrm{ns}}

% --- distancia ---
\newcommand{\um}{\,\mathrm{\mu m}}
\newcommand{\mm}{\,\mathrm{mm}}
\newcommand{\m}{\,\mathrm{m}}
\newcommand{\km}{\,\mathrm{km}}

% --- Otros ---
\newcommand{\percent}{\,\%}
\newcommand{\degree}{^{\circ}}

% Estilo de capítulos y secciones
\titleformat{name=\chapter,numberless}[block]
  {\normalfont\LARGE\bfseries}{}{0pt}{}
\titleformat{\chapter}[block]{\normalfont\LARGE\bfseries }{\thechapter\hspace{1em}}{0pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{20pt}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

\titleformat{\section} {\normalfont\Large\bfseries } {\thesection  \hspace{1em}}{0pt}{}
\titlespacing*{\section} {5pt}{18pt plus 2pt minus 2pt}{8pt}

\titleformat{\subsection} {\normalfont\large\bfseries}{\thesubsection  \hspace{1em}}{0pt}{}
\titlespacing*{\subsection} {10pt}{12pt plus 1pt minus 1pt}{6pt}

% Índice
\renewcommand{\contentsname}{Tabla de Contenidos}

% Interlineado de las tablas
\renewcommand{\arraystretch}{1.5}


