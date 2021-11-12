%%
%% This is file 'cppsthesis.cls'.
%%
%% Copyright (c) 2021 Shigetaka Taga
%%
%% This software is released under the MIT License.
%%   https://github.com/tagacchy/cppsthesis/blob/main/LICENSE
%%
%% For further information, see the document 'cppsthesis.pdf'.
%%
%% NOTICE: This file contains Japanese characters.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cppsthesis}[2021/11/12 v2.0.0 Document class for graduate thesis of Tsukuba's CPPS]
\RequirePackage{kvoptions}

% オプションの定義と処理
\DeclareBoolOption{toc}
\DeclareBoolOption{lof}
\DeclareBoolOption{lot}
\DeclareBoolOption{separatetitles}
\DeclareBoolOption{nolabel}
\DeclareBoolOption{centertitle}
\DeclareBoolOption{centerall}
\def\cppsthesis@fontsize{10pt}
\DeclareVoidOption{10.5pt}{\def\cppsthesis@fontsize{10.5pt}}
\DeclareStringOption[1]{abstract}
\DeclareStringOption{jlreqoptions}
\ProcessKeyvalOptions*
\ifcppsthesis@centerall\cppsthesis@centertitletrue\cppsthesis@nolabeltrue\fi

% jlreq.clsの読み込み（landscapeとtateは上書きで対処できないのでエラー処理）
\LoadClass[\cppsthesis@jlreqoptions,paper=a4,fontsize=\cppsthesis@fontsize,jafontsize=\cppsthesis@fontsize,%
  head_space=20mm,foot_space=20mm,fore-edge=25mm,gutter=25mm,report,oneside,onecolumn,openany,number_of_lines={},line_length={}]{jlreq}
\if@landscape\errmessage{DON'T use "landscape" option!!}\fi
\if@tate\errmessage{DON'T use "tate" option!!}\fi

% 不使用コマンドクリア
\let\@date\@empty
\let\date\relax
\let\and\relax
\let\@thanks\@empty
\let\thanks\relax
\let\abstractname\@empty

% 追加の項目入力コマンド定義（titleはnot longに再定義）
\DeclareRobustCommand*\academicyear[1]{\gdef\@academicyear{#1}}
\DeclareRobustCommand*\title[1]{\gdef\@title{#1}}
\newif\ifcppsthesis@subtitlegiven\cppsthesis@subtitlegivenfalse
\DeclareRobustCommand*\subtitle[1]{\cppsthesis@subtitlegiventrue\gdef\@subtitle{#1}}
\DeclareRobustCommand*\major[1]{\gdef\@major{#1}}
\DeclareRobustCommand*\studentID[1]{\gdef\@studentID{#1}}
\DeclareRobustCommand*\advisor[1]{\gdef\@advisor{#1}}

% abstract環境を再定義（微修正）
\renewenvironment{abstract}{%
  \ifx l\jlreq@engine\else
    \def\jlreq@parhook@abstract{\futurelet\jlreq@nextchar\jlreq@openbracket@hook}%
    \PushPostHook{par}{\jlreq@parhook@abstract}%
  \fi
  \global\setbox\jlreq@abstractbox=\vtop\bgroup
  \everypar{}%
  \bgroup\normalsize
  \parindent=1\zw
  \bgroup\hsize=\dimexpr\textwidth+\marginparwidth+\marginparsep\relax
  \begin{center}%
    \Large\rmfamily\mdseries 要旨%
  \end{center}\egroup%
  \list{}{%
    \listparindent\parindent
    \itemindent\listparindent
    \labelwidth\z@
    \labelsep\z@
    \leftmargin=1\zw
    \rightmargin\leftmargin
    \@tempdima=1\zw
    \@tempdimb=\dimexpr\linewidth-\@totalleftmargin-\leftmargin-\rightmargin\relax
    \@tempdimc=\@tempdimb
    \divide\@tempdimb by \@tempdima\multiply\@tempdimb by \@tempdima
    \ifdim\@tempdimb=\@tempdimc\else\@tempdimb=\dimexpr\@tempdimb-1\zw\relax\fi
    \leftmargin=\dimexpr\leftmargin+(\@tempdimc-\@tempdimb)/2\relax
    \rightmargin=\dimexpr\rightmargin+(\@tempdimc-\@tempdimb)/2-\marginparwidth-\marginparsep\relax
    \parsep\z@\@plus.1\zh
  }%
  \item\relax
}{%
  \endlist
  \egroup
  \egroup
  \ifx l\jlreq@engine\else
    \def\jlreq@parhook@abstract{}%
  \fi
}

% 項目名設定
\ifcppsthesis@nolabel
  \def\@titlelabel{}
  \def\@majorlabel{}
  \def\@studentIDlabel{}
  \def\@authorlabel{}
  \def\@advisorlabel{指導教員\hspace{1\zw}}
\else
  \def\@titlelabel{題\hspace{2\zw}目：\hbox{}}
  \def\@majorlabel{主\hspace{.5\zw}専\hspace{.5\zw}攻：\hbox{}}
  \def\@studentIDlabel{学籍番号：\hbox{}}
  \def\@authorlabel{氏\hspace{2\zw}名：\hbox{}}
  \def\@advisorlabel{指導教員：\hbox{}}
\fi

% \maketitleの再定義
\let\cppsthesis@break\\
\renewcommand{\maketitle}{%
  \hsize=\dimexpr\textwidth+\marginparwidth+\marginparsep\relax
  % 中表紙
  \begin{titlepage}\LARGE
    \begin{center}%
      \vspace*{50pt}%
      \@academicyear 年度\\[10pt]%
      筑波大学理工学群社会工学類\\[10pt]%
      卒業研究論文
    \end{center}%
    \vfill
    % centertitle / centerall指定時の題目と副題
    \ifcppsthesis@centertitle
      \begin{center}%
        {\Huge\@title}\ifcppsthesis@subtitlegiven\\[15pt]\@subtitle\fi
      \end{center}%
      \vfill
    \fi
    % centerall指定時の残りの項目
    \ifcppsthesis@centerall
      \begin{center}%
        \@major\\[20pt]%
        \@studentID\\[20pt]%
        \@author\\[20pt]%
        \@advisorlabel\@advisor
      \end{center}%
    % ここからリスト形式で左寄せ。LARGEだったりLargeだったりするので細かい幅調整は無し。
    \else
      \list{}{%
        \labelwidth=\ifcppsthesis@nolabel\z@\else5\zw\fi
        \labelsep\z@
        \leftmargin\labelwidth
        \rightmargin=\dimexpr-\marginparwidth-\marginparsep\relax
        \itemsep=20pt
      }%
      % デフォルト時の題目と副題
      \ifcppsthesis@centertitle\else
        \item[\@titlelabel]\@title
        \ifcppsthesis@subtitlegiven\\{\Large\@subtitle}\fi
      \fi
      % デフォルト時、centertitle指定時の残りの項目
      \item[\@majorlabel]\@major
      \item[\@studentIDlabel]\@studentID
      \item[\@authorlabel]\@author
      \item[\@advisorlabel]\@advisor
      \endlist
    \fi
  \end{titlepage}%
  % 中表紙裏（空白ページ）
  \newpage\thispagestyle{empty}\mbox{}%
  % 要旨（abstract指定回数だけ繰り返す）
  \@tempcnta\z@
  \loop\ifnum\@tempcnta<\cppsthesis@abstract
    % 要旨ページ
    \newpage\thispagestyle{empty}\vspace*{20pt}%
    \let\\\relax
    \ifcppsthesis@separatetitles
      \leftline{\Large\@title}
      \ifcppsthesis@subtitlegiven\leftline{\Large\quad\@subtitle}\fi
    \else
      \leftline{\Large\@title\ifcppsthesis@subtitlegiven\quad\@subtitle\fi}%
    \fi
    \let\\\cppsthesis@break
    \vspace{20pt}%
    \centerline{\Large\@major\qquad\@studentID\qquad\@author}%
    \vspace{20pt}%
    \rightline{\Large\@advisorlabel\@advisor}%
    \vspace{40pt}%
    \setbox\@tempboxa=\copy\jlreq@abstractbox
    \unvbox\@tempboxa
    % 要旨裏（空白ページ）
    \newpage\thispagestyle{empty}\mbox{}%
  \advance\@tempcnta1\repeat
  \setbox\jlreq@abstractbox=\copy\voidb@x
  % toc / lof / lot 指定時にそれぞれ出力
  \ifnum\ifcppsthesis@toc1\fi\ifcppsthesis@lof1\fi\ifcppsthesis@lot1\else0\fi>0%
    \newpage\setcounter{page}{1}\pagenumbering{roman}%
    \ifcppsthesis@toc\tableofcontents\fi
    \ifcppsthesis@lof\listoffigures\fi
    \ifcppsthesis@lot\listoftables\fi
  \fi
  % 本文開始処理
  \newpage\hsize\textwidth\setcounter{page}{1}\pagenumbering{arabic}%
  % 使用済みコマンドのクリア
  \global\let\@academicyear\@empty
  \global\let\@title\@empty
  \global\let\@subtitle\@empty
  \global\let\@major\@empty
  \global\let\@studentID\@empty
  \global\let\@author\@empty
  \global\let\@advisor\@empty
  \global\let\cppsthesis@abstract\@empty
  \global\let\@titlelabel\@empty
  \global\let\@majorlabel\@empty
  \global\let\@studentIDlabel\@empty
  \global\let\@authorlabel\@empty
  \global\let\@advisorlabel\@empty
  \global\let\academicyear\relax
  \global\let\title\relax
  \global\let\subtitle\relax
  \global\let\major\relax
  \global\let\studentID\relax
  \global\let\author\relax
  \global\let\advisor\relax
  \global\let\cppsthesis@break\relax
  \global\let\maketitle\relax
}
\endinput