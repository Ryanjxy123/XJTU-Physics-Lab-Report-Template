\ProvidesClass{xjtureport}

\makeatletter  % 允许使用 @ 命令

% 基础文档类
\LoadClass{ctexart}

% 载入宏包
\RequirePackage{xeCJK}
\RequirePackage{CJKnumb}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{mathtools}
\RequirePackage{float}
\RequirePackage{indentfirst}
\RequirePackage{zhnumber}
\RequirePackage{booktabs}

% 行距
\linespread{1.2}

% 页面设置
\geometry{top=1in,bottom=1in,left=1in,right=1in}
\setcounter{secnumdepth}{3}

% 标题编号格式
\renewcommand\thesection{\CJKnumber{\arabic{section}}、}
\renewcommand\thesubsection{\arabic{subsection}.}
\renewcommand\thesubsubsection{(\arabic{subsubsection})}

\titleformat{\section}{\bfseries\Large}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries\normalsize}{\thesubsection}{0.8em}{}
\titleformat{\subsubsection}{\normalsize}{\thesubsubsection}{0.6em}{}

% 列表编号格式
\setlist[enumerate,1]{label=(\arabic*)}
\setlist[enumerate,2]{label=\alph*.}

% 信息定义
\newcommand\name[1]{\def\@name{#1}}
\newcommand\stuid[1]{\def\@stuid{#1}}
\newcommand\class[1]{\def\@class{#1}}
\newcommand\course[1]{\def\@course{#1}}
\newcommand\coursenum[1]{\def\@coursenum{#1}}
\newcommand\grades[1]{\def\@grades{#1}}
\newcommand\expname[1]{\def\@expname{#1}}
\newcommand\partner[1]{\def\@partner{#1}}
\newcommand\reviewdate[1]{\def\@reviewdate{#1}}

% 初始化，避免未设置时报错
\name{} \stuid{} \class{} \date{} \course{} \coursenum{} 
\grades{} \expname{} \partner{} \reviewdate{}

% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhead[C]{
    \small
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} l l l l @{}}
        \bfseries 班级：\@class &
        \bfseries 姓名：\@name &
        \bfseries 学号：\@stuid &
        \bfseries 课序号：\@coursenum
    \end{tabular*}
}


\fancyfoot[C]{\thepage}

% 下划线命令
\def\xjtuu[#1]#2{
    \underline{\hbox to #1{\hfil#2\hfil}}
}

% 首页头部
\newcommand{\makeheader}{
    \thispagestyle{fancy}
    \vspace{1.5em}

    % 实验名称：标题 + 连续下划线 + 内容
    \begin{center}
        {\bfseries\Large 
            实验名称：\underline{\hbox to 10cm{\hfil\@expname\hfil}}
        }
    \end{center}

    \vspace{1em}

    % 成绩框（加大到 3cm）
    \begin{flushright}
成绩 \fbox{\hbox to 2cm{\hfil\raisebox{5pt}{\rule{0pt}{1em}\@grades}\hfil}}

    \end{flushright}

    \vspace{0.5em}

\begin{center}
\begin{tabular}{@{}l l l@{}}
    实验日期： \xjtuu[4cm]{\@date} 
    & \hspace{3em} 教师签字： \xjtuu[4cm]{} 
    & \\
    同组者：  \xjtuu[4cm]{\@partner} 
    & \hspace{3em} 审阅日期： \xjtuu[4cm]{\@reviewdate} 
    & \\
\end{tabular}
\end{center}    

    \vspace{2em}
}

% 封面页（可选）
\newcommand{\makecover}{
    \begin{center}
        \includegraphics[width=0.8\linewidth]{cover}
        \vspace{1cm}

        {\huge\bfseries \@title}\\[0.5cm]
        {\Large\bfseries \@expname}

        \vspace{3cm}

        \renewcommand\arraystretch{1.6}
        \begin{tabular}{p{3cm}p{6cm}}
            \bfseries{课程名称：} & \@course \\ \cline{2-2}
            \bfseries{姓名：}     & \@name \\ \cline{2-2}
            \bfseries{专业：}     & \@class \\ \cline{2-2}
            \bfseries{学号：}     & \@stuid \\ \cline{2-2}
        \end{tabular}

        \vspace{2cm}
        {\Large \@date}
    \end{center}
    \thispagestyle{empty}
    \newpage
}

\makeatother  % 结束 @ 支持
