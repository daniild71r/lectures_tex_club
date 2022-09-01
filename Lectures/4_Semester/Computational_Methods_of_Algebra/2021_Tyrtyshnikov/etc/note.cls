% ----------- identification -----------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{etc/note}[2021/01/28]

% ----------- declaration of options -----------
\DeclareOption*          {\PassOptionsToClass{\CurrentOption}{article}}
% ----------- execution of options -----------
\ProcessOptions \relax

% ----------- package loading -----------
\LoadClass{article}          % the real code

% =========== main code ===========
% ----------- Text -----------
%%% Работа с русским языком
\RequirePackage{cmap}				% поиск в PDF
\RequirePackage[T2A]{fontenc}		% кодировка
\RequirePackage[utf8]{inputenc}     % кодировка исходного текста
\RequirePackage[english,russian]{babel} % локализация и переносы

\setlength{\parindent}{0pt}% Устанавливает длину красной строки 0pt
\sloppy                    % строго соблюдать границы текста
\linespread{1.3}           % коэффициент межстрочного интервала
\setlength{\parskip}{0.5em}% вертик. интервал между абзацами
%\setcounter{secnumdepth}{0}% отключение нумерации разделов
%\setcounter{section}{-1}   % Чтобы сделать нумерацию лекций с нуля
\RequirePackage{soulutf8}      % Модификаторы начертания

% to erase number before sections
\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\Large\bfseries}{}{0em}{}
% To center parameter \filcenter may be added inside 3rd curl braces {}
% To change color of section text -- add parameter \color{blue}
% 4th mandatory {} param is the space at the beginning

\newcommand{\linkcolor}{blue}
\newcommand{\citecolor}{green}
\newcommand{\filecolor}{magenta}
\newcommand{\urlcolor}{NavyBlue}

%%% Гиппер ссылки
\RequirePackage{hyperref}
\RequirePackage[usenames,dvipsnames,svgnames,table,rgb]{xcolor}
\hypersetup{				% Гиперссылки
	unicode=true,           % русские буквы в раздела PDF\\
	pdfstartview=FitH,
	colorlinks=true,  % false: ссылки в рамках; true: цветные ссылки
	linkcolor=\linkcolor,         % внутренние ссылки
	citecolor=\citecolor,        % на библиографию
	filecolor=\filecolor,      % на файлы
	urlcolor=\urlcolor,      % на URL
}

% ----------- Страница -----------
\RequirePackage{geometry} % page geometry

%%%         Контитулы
\RequirePackage{fancyhdr}
\setlength{\headheight}{18pt}
\pagestyle{fancy}
% Length to control the \fancyheadoffset and the calculation of \headline simultaneously
\newlength\FHoffset
\setlength\FHoffset{1cm}

\addtolength\headwidth{4.3\FHoffset}
\fancyheadoffset{\FHoffset}

% these lengths will control the headrule trimming to the left and right 
\newlength\FHleft
\newlength\FHright

% here the trimmings are controlled by the user
\setlength\FHleft{0cm}
\setlength\FHright{0cm}

% The new definition of headrule that will take into acount the trimming(s)
\newbox\FHline
\setbox\FHline=\hbox{\hsize=\paperwidth%
  \hspace*{\FHleft}%
  \rule{\dimexpr\headwidth-\FHleft-\FHright\relax}{\headrulewidth}\hspace*{\FHright}%
}
\renewcommand\headrule{\vskip-.7\baselineskip\copy\FHline}


% -----------  Images -----------
\RequirePackage{float}
\RequirePackage{graphicx}                           % Для вставки рисунков
\setlength\fboxsep{3pt}           % Отступ рамки \fbox{} от рисунка
\setlength\fboxrule{1pt}          % Толщина линий рамки \fbox{}
\usepackage{wrapfig}              % Обтекание рисунков текстом

%  ----------- Title -----------
\RequirePackage{ifthen} 
\newcommand{\FullCourseNameFirstPart}{\so{НАЗВАНИЕ~ПРЕДМЕТА}}
\newcommand{\FullCourseNameSecondPart}{\so{}}
\newcommand{\SchoolName}{ФПМИ}
\newcommand{\TrackName}{ПМИ}
\newcommand{\SemesterNumber}{III}
\newcommand{\LecturerInitials}{Фамилия Имя Отчество}
\newcommand{\AutherInitials}{}
\newcommand{\VKLink}{}
\newcommand{\OverleafLink}{}
\newcommand{\GithubLink}{}
\newcommand{\ImageName}{logo_LTC}

\newcommand{\AuthorA}{} \newcommand{\AuthorB}{} \newcommand{\AuthorC}{} \newcommand{\AuthorD}{}

\newcommand{\WriteAuthors}{%
\ifthenelse{\equal{\AuthorB}{}}{Автор: }{Авторы: }%
\ifthenelse{\equal{\AuthorA}{}}{}{\AuthorA}%
\ifthenelse{\equal{\AuthorB}{}}{}{, \AuthorB}%
\ifthenelse{\equal{\AuthorC}{}}{}{, \AuthorC}%
\ifthenelse{\equal{\AuthorD}{}}{}{, \AuthorD}%
}

\renewcommand{\maketitle}{%
\begin{titlepage}
	\clearpage\thispagestyle{empty}
	\centering
	
	\textit{Федеральное государственное автономное учреждение \\
		высшего образования}
	\vspace{0.5ex}
	
	\textbf{Московский физико-технический институт
    \\
    (национальный исследовательский университет)}
	\vspace{20ex}
	
	\rule{\linewidth}{0.5mm}
	{\textbf{\FullCourseNameFirstPart}}
	\ifthenelse{\equal{\FullCourseNameSecondPart}{}}{}{
	\\
	{\textbf{\FullCourseNameSecondPart}}}
	\rule{\linewidth}{0.5mm}
	
	\SemesterNumber
	\\
	\SchoolName
	\\
	\TrackName
	\\
	\LecturerInitials
	\vspace{1ex}
	
	\begin{figure}[!ht]
		\centering
		\includegraphics[width=0.6\textwidth]{\ImageName}
	\end{figure}
\begin{flushright}
	\noindent
	\WriteAuthors
	\ifthenelse{\equal{\OverleafLink}{}}{}{
	\\
	\href{\OverleafLink}{\textit{Проект на overleaf}}}
	\ifthenelse{\equal{\GithubLink}{}}{}{
	\\
	\href{\GithubLink}{\textit{Проект на GitHub}}}
\end{flushright}
	
	\vfill
	Долгопрудный, \CourseDate\ год.
	\pagebreak
	
\end{titlepage}%
}

% ----------- Math and theorems -----------
\RequirePackage{amsthm,amssymb,xparse}
