%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"

\include "includes/header-paper.ily"
\include "includes/title-page.ily"
\include "includes/polonaise-op26-no1-parts.ily"
\include "includes/polonaise-op26-no2-parts.ily"

% Title page

\titlePage

% Table of contents

\bookpart {
  \header {
    title = ##f
    subtitle = ##f
    composer = ##f
    arranger = ##f
    copyright = ##f
    tagline = ##f
  }
  \markuplist \table-of-contents
}

% PDFs

\tocItem \markup \concat { 
  "No. 1 Allegro appassionato in C" \raise #0.75 \teeny \sharp " minor" 
}
\polonaiseOneNotes
\pageBreak

\tocItem \markup \concat { 
  "No. 2 Maestoso in E" \raise #0.75 \teeny \flat " minor" 
}
\polonaiseTwoNotes

% Midi

\polonaiseOneMidi
\polonaiseTwoMidi
