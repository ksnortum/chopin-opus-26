%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"
\include "force-initial-clef.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . 0) (0 . 0) (0 . 0.25) (0 . 0.25)) \etc
slurShapeB = \shape #'((0 . 0) (2 . 0.25) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'((0 . 0) (0 . 0) (0 . 4.5) (0 . 4.5)) \etc
slurShapeD = \shape #'(
                        ((0 . 3) (0 . 2) (0 . 0) (0 . 0))
                        ((0 . 1) (0 . 1) (1 . 0) (0 . 0))
                      ) \etc
slurShapeE = \shape #'((0 . 0) (-1 . 0) (0 . 1) (0 . 0)) \etc
slurShapeF = \shape #'(
                        ((0 . 0) (-1 . 0) (0 . 1) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc

tieShapeA = \shape #'((0 . 0) (0 . 0) (0 . -0.5) (0 . -0.5)) \etc

moveNoteA = \once {
  \override NoteColumn.force-hshift = 1.25
  \override Stem.length = 6.5
}
moveNoteB = \once \override NoteColumn.force-hshift = 1.25
moveAccidentalA = \once {
  \override Accidental.extra-spacing-width = #'(0 . -1)
  \override Accidental.extra-offset = #'(1.6 . 0)
}

stemLengthA = \once \override Stem.length = 11
stemLengthB = \once \override Stem.length = 8

%%% Music %%%

global = {
  \time 3/4
  \key ef \minor
  \set Staff.extraNatural = ##f
}

rightHandUpper = \relative {
  \repeat volta 2 {
    \trebleToBass
    bf16( cf a bf  ef,8) r r\pocoRitenSpanner <ef gf bf>16-.(\startTextSpan q |
    q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
    bf'16(^\accel cf a bf  ef,8) r r \pocoRitenSpanner <f af cf>16-.(
      \startTextSpan q |
    q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
    cf'16(^\accel df bf cf  ef,8) r r \ritenSpanner <f af cf>16-.( 
      \startTextSpan q |
    q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
    cf'16(^\aTempo df bf cf  ef,8)\noBeam <f af cf>16-. q-.  q8-. 
      <f cf' ef f>16-. q-. |
    q8-.\noBeam \clef treble \stemUp <f' cf' ef f>16-. q-.  q8-. q16-. q-.
      q8-. q16-. q-. |
      
    \barNumberCheck 9
    \stemNeutral <bf f' bf>2-^ ef,4->-\tieShapeA ~ |
    \tupletOff
    \slashedGrace { f8-\slurShapeA ( } ef2)\(-\trillLower\trill^\conForza
      \grace { d16*1/4( ef) } \magnifyMusic #2/3 { \tuplet 15/4 { f16 gf af
      bf cf df! \beamBreak ef f gf af bf cf df! ef f\) } } |
    gf4~-\slurShapeB ( gf16 ef bf gf  f[\mordent e f) r32 bf]->( |
    ef,!2) r8 d16(^\agitato ef |
    gf16 f f c)  cf4->~(  cf16 bf d ef |
    gf16 f f c)  cf4->~(  cf16 bf d ef |
    gf16 f) f( c)  af'( g) g( ef)  bf'( af)  af( ef) |
    cf'!16( bf) bf( f)  cf'( bf) bf( a)  bf( cf bf gf' |
    
    \barNumberCheck 17
    gf16 f f cf)  cf4->~(  cf16 bf d ef |
    gf16 f f cf)  cf4->~(  cf16 bf bf ff') |
    ff16( ef ef af,)  f'( ef ef gf,)  f'( ef ef \tag layout { f,) } 
      \tag midi { f32) r } | % make a tiny rest for the fermata
    \upperFermataOverBarLine
    r16 cf( cf d,) d4^>^( ef8) r |
  }
  % first note tenuto (consistency)
  \voiceOne f4-_ b8\rest df,-. f16-. ef-. df8-. |
  af'8-. af16-. af-.  bf-. af-. f-. df-.  bf'8-. gf-. |
  <af, df f>4-_ b'8\rest df,-.  f16-. ef-. df8-. |
  ef8-.\noBeam \oneVoice <c ef>16-. q-.  <df f>-. <c ef>-. <bf df>-. <c ef>-.
    <df f>8-. <f, df'>-. |
    
  \barNumberCheck 25
  <df' f>4^.^^ r8 \voiceOne df'8-.\noBeam f16-. ef-. df8-. |
  af'8-. af16-. af-.  bf-. af-. f-. df-.  bf'8-. gf-. |
  f4-.-^ b,8\rest df-.  f16-. ef-. df8-. |
  <gf, af ef'>8-. q16-. q-.  <gf af f'>-. <gf af ef'>-. <gf af df>-.
    <gf af ef'>-.  <f af f'>8-. <df df'>-. |
  \undo \omit TupletNumber
  <cs cs'>8-.\noBeam \tuplet 3/2 { ds'16->[( ds, ds' } <e, e'>8-.])
    <e a e'>16-. q-.  q8-. q-. |
  <e gs e'>8-. <gs d' e>16-. q-.  <gs d' fs>-. <gs d' e>-. <a d e a>-.
    <b d e b'>-.  <cs e cs'>8-. <a a'>-. |
  \oneVoice <a a'>8-.\noBeam \tuplet 3/2 { bf'!16->[( bf,! bf' } <c, c'>8-.])
    <c f c'>16-. q-.  q8-. q16-. q-. |
  <c e c'>8-. q16-. q-.  <d f d'>-. <c e c'>-. <f a f'>-. <g bf g'>-.
    <a c a'>8-. <f a f'>-. |
    
  \barNumberCheck 33
  <gf! a gf'!>8.->( ef'32 c  a gf ef c a gf ef c  a8-.) <bf df>[( |
  <a c>8]) \stemUp <gf'! gf'!>16->-. <f f'>-.  <e e'>8-. <f f'>16->-. <e e'>-.
    <ef ef'>8-. <d d'>16->-. <df df'>-. |
  <c c'>8-.\noBeam \stemNeutral <a'' c gf'>16-\slurShapeC ( ef'32 c  a gf ef c
    a gf ef c  a8-.) <bf df>[( |
  <a c>8]) \stemUp <gf'! gf'!>16->-. <f f'>-.  <e e'>8-. <f f'>16->-. <e e'>-.
    <ef ef'>8-. <d d'>16->-. <df df'>-. |
  <c c'>8-. <f f'>16->-. <e e'>-.  <ef ef'>8-. <ff ff'>16->-. <ef ef'>-.
    <d d'>8-. <df df'>16->-. <c c'>-. |
  <bf bf'>8-. <ef ef'>16->-. <d d'>-.  <df df'>8-. <ef ef'>16->-. <df df'>-.
    <c c'>8-. <bf bf'>16->-. <bf af'>-. |
  \voiceOne gf'2(\trill f16 gf af gf) |
  \oneVoice <a, f'>8\noBeam <f f'>16 q  \slurUp q8(^. q^. q^. q^.) |
  
  \barNumberCheck 41
  r4 <df' bf'>-\slurShapeD ( <c a'>~ |
  q4) \once \omit Accidental q( <b gs'>~ |
  q4)^\calando <cf! af'!> <bf g'> |
  \oneVoice <c ef gf!>( <d f>) r |
  \clef bass cf!4( d,) r |
  cf'4( d,) r |
  cf'4( d, cf' |
  d,4) r r |
  
  \barNumberCheck 49
  % like bar 1
  bf'16(^\aTempo cf a bf  ef,8) r r\pocoRitenSpanner <ef gf bf>16-.(
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  bf'16(^\accel cf a bf  ef,8) r r <f af cf>16-.(^\poco q |
  \ritenSpanner q8-.\startTextSpan q16-. q -.  q8-. q16-. q-. q8-.) 
    r\stopTextSpan |
  cf'16(^\accel df bf cf  ef,8) r r \ritenSpanner <f af cf>16-.( 
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  cf'16(^\aTempo df bf cf  ef,8)\noBeam <f af cf>16-. q-.  q8-. 
    <f cf' ef f>16-. q-. |
  q8-.\noBeam \clef treble \stemUp <f' cf' ef f>16-. q-.  q8-. q16-. q-.
    q8-. q16-. q-. |
      
  \barNumberCheck 57
  % like bar 9
  \stemNeutral <bf f' bf>2-^ ef,4->-\tieShapeA ~ |
  \tupletOff
  \slashedGrace { f8-\slurShapeA ( } ef2)\(-\trillLower\trill^\conForza 
    \grace { d16*1/4( ef) } \magnifyMusic #2/3 { \tuplet 15/4 { f16 gf af bf
    cf df! \beamBreak ef f gf af bf cf df! ef f\) } } |
  gf4~-\slurShapeB ( gf16 ef bf gf  f[\mordent e f) r32 bf]->( |
  ef,!2) r8 d16(^\agitato ef |
  gf16 f f c)  cf4->~(  cf16 bf d ef |
  gf16 f f c)  cf4->~(  cf16 bf d ef |
  gf16 f) f( c)  af'( g) g( ef)  bf'( af)  af( ef) |
  cf'!16( bf) bf( f)  cf'( bf) bf( a)  bf( cf bf gf' |
  
  \barNumberCheck 65
  % like 17 (4 bars)
  gf16 f f cf)  cf4->~(  cf16 bf d ef |
  gf16 f f cf)  cf4->~(  cf16 bf bf ff') |
  ff16( ef ef af,)  f'( ef ef gf,)  f'( ef ef \tag layout { f,) } 
      \tag midi { f32) r } |
  \upperFermataOverBarLine
  r16 cf( cf d,) d4^>^( ef8) r |
  \bar "||"
  \key b \major
  <b ds fs>4^\staccatoMarkup r8 q-. <b e gs>-. <b ds fs>16.-. <b css es>32-. |
  <b ds fs>8-. <fs b ds>-. r \clef bass q-. <gs b e>-. <fs b ds>16.-.
    <e b' cs>32-. |
  <fs b ds>8-. <ds fs b>-. r \clef treble <ds' fs>16^(^\sostenuto q q8
    <ds gs> |
  <ds as'>8 q16 q  <css as'>8 <as css as'>  <as e'! cs'!>4^\ten |
  
  \barNumberCheck 73
  <b ds fs>4-.) r8 q-. <b e gs>-. <b ds fs>16.-. <b css es>32-. |
  <b ds fs>8-. <fs b ds>-. r \clef bass <gs b ds>-.  <gs cs e>-. <gs b ds>16.-.
    <gs as cs>32-. |
  <gs b ds>8-. <ds gs b>-. r \clef treble <ds' b'>16^( q  q8 <e b'> |
  q8)\noBeam \voiceOne cs'16.( ds32  \oneVoice <e, cs'>4-> <ds b'>8) r |
  <b ds fs>4 r8 q-. <b e gs>-. <b ds fs>16.-. <b css es>32-. |
  <b ds fs>8-. <fs b ds>-. r \clef bass q-. <gs b e>-. <fs b ds>16.-.
    <e b' cs>32-. |
  <fs b ds>8-. <ds fs b>-. r \clef treble <b' ds fs>16^( q  q8 <as ds fs> |
  <as ds fs as>8 q16 q  q8 q  <as e' fs cs'>4^\ten |
  
  \barNumberCheck 81
  <a b ds fs>4-.) r8 <b ds fs>-.  <b ds gs>-. <b ds fs>16.-. <b ds es>32-. |
  <b ds fs>8-. <b ds>-. r \clef bass <a b ds>\( <g b e>_>( <g b ds>16.-.) 
    <g b cs>32-. |
  <fs b ds>8-. <ds fs b>-.\) r \clef treble <b' ds b'>16^( q  q8 <b e b'> |
  q8)\noBeam \voiceOne <e cs'>16.(\arpeggio <fs ds'>32 \oneVoice <e cs'>4->
    <ds b'>~ |
  <ds fs as>4-.) r8 q-.  <ds gs b>-. <ds fs as>16.-. <ds es gs>32-. |
  <ds fs as>8-. <as ds fs>-. r q-.  <b ds gs>-. <as css fs>16.-.
    <as css es>32-. |
  <as ds fs>8-. <fs as ds>-. r <as ds fs as>16^( q  q8 q16 q |
  q8 q16 q  q8 q  <as e' fs cs'>4^\ten |
  
  \barNumberCheck 89
  % like 81
  <a b ds fs>4-.) r8 <b ds fs>-.  <b ds gs>-. <b ds fs>16.-. <b ds es>32-. |
  <b ds fs>8-. <b ds>-. r \clef bass <a b ds>\( <g b e>_>( <g b ds>16.-.) 
    <g b cs>32-. |
  <fs b ds>8-. <ds fs b>-.\) r \clef treble <b' ds b'>16^( q  q8 <b e b'> |
  q8)\noBeam \voiceOne <e cs'>16.(\arpeggio <fs ds'>32 \oneVoice <e cs'>4->
    <ds b'>~ |
  <as ds fs as>4-.) r8 <ds fs as>-.  <ds gs b>-. <ds fs as>16.-.
    <ds es gs>32-. |
  <ds fs as>8-. <as ds fs>-. r q-.  <b ds gs>-. <as ds fs>16.-.
    <b css es>32-. |
  <as ds fs>8-. <fs as ds>-. r <as ds fs as>16^( q  q8 q16 q |
  q8 q16 q  q8 q  <as e' fs cs'>4^\ten |
  
  \barNumberCheck 97
  <a b ds fs>4-.) r8 <a b ds fs b>-.^(  <a b ds gs b>-. <a b ds fs b>16-.
    <a b ds es b'>-. |
  <a b ds fs b>8-. <a b ds b'>-.) r \clef bass <a b ds>-.\( <g b e>_>(
    <g b ds>16.-.) <g cs>32-. |
  <fss cs' ds>8-. <ds gs! b>-.\) r \clef treble <b' ds b'>16^( q  q8 <b e b'> |
  q8)\noBeam \voiceOne <e cs'>16.(\arpeggio <fs ds'>32 \oneVoice <e cs'>4
    <ds b'>8) r |
  r8^\mancando \voiceOne b'16.( cs32  b4 as8) \oneVoice r |
  r \voiceOne b16.( cs32  b4 as8) \oneVoice r |
  r4 \clef bass \voiceOne b,( gs |
  bf2.)\fermata |
  \bar "||"
  \key ef \minor
  
  \barNumberCheck 105
  % like bar 1
  \oneVoice bf16( cf a bf  ef,8) r r\pocoRitenSpanner <ef gf bf>16-.(
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  bf'16(^\accel cf a bf  ef,8) r r \pocoRitenSpanner <f af cf>16-.(
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  cf'16(^\accel df bf cf  ef,8) r r \ritenSpanner <f af cf>16-.( 
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  cf'16(^\aTempo df bf cf  ef,8)\noBeam <f af cf>16-. q-.  q8-. 
    <f cf' ef f>16-. q-. |
  q8-.\noBeam \clef treble \stemUp <f' cf' ef f>16-. q-.  q8-. q16-. q-.
    q8-. q16-. q-. |
    
  \barNumberCheck 113
  % like bar 9
  \stemNeutral <bf f' bf>2-^ ef,4->-\tieShapeA ~ |
  \tupletOff
  \slashedGrace { f8-\slurShapeA ( } ef2)\(-\trillLower\trill^\conForza 
    \grace { d16*1/4( ef) } \magnifyMusic #2/3 { \tuplet 15/4 { f16 gf af bf
    cf df! \beamBreak ef f gf af bf cf df! ef f\) } } |
  gf4~-\slurShapeB ( gf16 ef bf gf  f[\mordent e f) r32 bf]->( |
  ef,!2) r8 d16(^\agitato ef |
  gf16 f f c)  cf4->~(  cf16 bf d ef |
  gf16 f f c)  cf4->~(  cf16 bf d ef |
  gf16 f) f( c)  af'( g) g( ef)  bf'( af)  af( ef) |
  cf'!16( bf) bf( f)  cf'( bf) bf( a)  bf( cf bf gf' |
  
  \barNumberCheck 121
  % like 17 (4 bars)
  gf16 f f cf)  cf4->~(  cf16 bf d ef |
  gf16 f f cf)  cf4->~(  cf16 bf bf ff') |
  ff16( ef ef af,)  f'( ef ef gf,)  f'( ef ef \tag layout { f,) } 
      \tag midi { f32) r } |
  \upperFermataOverBarLine
  r16 cf( cf d,) d4^>^( ef8) r |
  % like 21
  \voiceOne f4-_ b8\rest df,-. f16-. ef-. df8-. |
  af'8-. af16-. af-.  bf-. af-. f-. df-.  bf'8-. gf-. |
  <af, df f>4-_ b'8\rest df,-.  f16-. ef-. df8-. |
  ef8-.\noBeam \oneVoice <c ef>16-. q-.  <df f>-. <c ef>-. <bf df>-. <c ef>-.
    <df f>8-. <f, df'>-. |
    
  \barNumberCheck 129
  % like 25
  <df' f>4^.^^ r8 \voiceOne df'8-.\noBeam f16-. ef-. df8-. |
  af'8-. af16-. af-.  bf-. af-. f-. df-.  bf'8-. gf-. |
  f4-.-^ b,8\rest df-.  f16-. ef-. df8-. |
  <gf, af ef'>8-. q16-. q-.  <gf af f'>-. <gf af ef'>-. <gf af df>-.
    <gf af ef'>-.  <f af f'>8-. <df df'>-. |
  \undo \omit TupletNumber
  <cs cs'>8-.\noBeam \tuplet 3/2 { ds'16->[( ds, ds' } <e, e'>8-.])
    <e a e'>16-. q-.  q8-. q-. |
  <e gs e'>8-. <gs d' e>16-. q-.  <gs d' fs>-. <gs d' e>-. <a d e a>-.
    <b d e b'>-.  <cs e cs'>8-. <a a'>-. |
  \oneVoice <a a'>8-.\noBeam \tuplet 3/2 { bf'!16->[( bf,! bf' } <c, c'>8-.])
    <c f c'>16-. q-.  q8-. q16-. q-. |
  <c e c'>8-. q16-. q-.  <d f d'>-. <c e c'>-. <f a f'>-. <g bf g'>-.
    <a c a'>8-. <f a f'>-. |
    
  \barNumberCheck 137
  % like 33
  <gf! a gf'!>8.->( ef'32 c  a gf ef c a gf ef c  a8-.) <bf df>[( |
  <a c>8]) \stemUp <gf'! gf'!>16->-. <f f'>-.  <e e'>8-. <f f'>16->-. <e e'>-.
    <ef ef'>8-. <d d'>16->-. <df df'>-. |
  <c c'>8-.\noBeam \stemNeutral <a'' c gf'>16->-\slurShapeC ( ef'32 c  a gf ef
    c a gf ef c a8-.) <bf df>[( |
  <a c>8]) \stemUp <gf'! gf'!>16->-. <f f'>-.  <e e'>8-. <f f'>16->-. <e e'>-.
    <ef ef'>8-. <d d'>16->-. <df df'>-. |
  <c c'>8-. <f f'>16->-. <e e'>-.  <ef ef'>8-. <ff ff'>16->-. <ef ef'>-.
    <d d'>8-. <df df'>16->-. <c c'>-. |
  <bf bf'>8-. <ef ef'>16->-. <d d'>-.  <df df'>8-. <ef ef'>16->-. <df df'>-.
    <c c'>8-. <bf bf'>16->-. <bf af'>-. |
  \voiceOne gf'2(\trill f16 gf af gf) |
  \oneVoice <a, f'>8\noBeam <f f'>16 q  \slurUp q8(^. q^. q^. q^.) |
  
  \barNumberCheck 145
  % like 41
  r4 <df' bf'>-\slurShapeD ( <c a'>~ |
  q4) \once \omit Accidental q( <b gs'>~ |
  q4)^\calando <cf! af'!> <bf g'> |
  \oneVoice <c ef gf!>( <d f>) r |
  \clef bass cf!4( d,) r |
  cf'4( d,) r |
  cf'4( d, cf' |
  d,4) r r |
  
  \barNumberCheck 153
  % like 49 and 1
  bf'16(^\aTempo cf a bf  ef,8) r r\pocoRitenSpanner <ef gf bf>16-.(
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  bf'16(^\accel cf a bf  ef,8) r r \pocoRitenSpanner <f af cf>16-.(
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  cf'16(^\accel df bf cf  ef,8) r r \ritenSpanner <f af cf>16-.( 
    \startTextSpan q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r\stopTextSpan |
  cf'16(^\aTempo df bf cf  ef,8)\noBeam <f af cf>16-. q-.  q8-. 
    <f cf' ef f>16-. q-. |
  q8-.\noBeam \clef treble \stemUp <f' cf' ef f>16-. q-.  q8-. q16-. q-.
    q8-. q16-. q-. |
    
  \barNumberCheck 161
  % like bar 57 and 9
  \stemNeutral <bf f' bf>2-^ ef,4->-\tieShapeA ~ |
  \tupletOff
  \slashedGrace { f8-\slurShapeA ( } ef2)\(-\trillLower\trill^\conForza
    \grace { d16*1/4( ef) } \magnifyMusic #2/3 { \tuplet 15/4 { f16 gf af bf
    cf df! \beamBreak ef f gf af bf cf df! ef f\) } } |
  gf4~-\slurShapeB ( gf16 ef bf gf  f[\mordent e f) r32 bf]->( |
  ef,!2) r8 d16(^\agitato ef |
  gf16 f f c)  cf4->~(  cf16 bf d ef |
  gf16 f f c)  cf4->~(  cf16 bf d ef |
  gf16 f) f( c)  af'( g) g( ef)  bf'( af)  af( ef) |
  cf'!16( bf) bf( f)  cf'( bf) bf( a)  bf( cf bf gf' |
  
  \barNumberCheck 169
  % like 65 17 (3 bars)
  gf16 f f cf)  cf4->~(  cf16 bf d ef |
  gf16 f f cf)  cf4->~(  cf16 bf bf ff') |
  ff16( ef ef af,)  f'( ef ef gf,)  f'( ef ef f,) |
  \accelEStretto r16^\startTextSpan cf( cf d,  \tag layout { d2->) }
    \tag midi { d4.) r8 } |
  \upperFermataOverBarLine
  r16 c'( c ef,  \tag layout { \after 4. \stopTextSpan ef2->) } 
    \tag midi { ef4.) r8 } |
  \upperFermataOverBarLine
  r16 \ritenAssai gf'(\startTextSpan gf gf,  gf4->~)  gf16 gf( f ef
    \stopTextSpan |
  ef16 cf' cf d,)  \voiceOne d4->( ef8) \oneVoice r |
  \bar "|."
}

rightHandLower = \relative {
  \repeat volta 2 {
    \voiceFour 
    s2. * 8 |
    
    \barNumberCheck 9
    s2. * 8 |
    
    \barNumberCheck 17
    s2. * 3 |
    s4 r8 af( gf) s |
  }
  <f af>4-. s8 bf-. af[-. bf]-. |
  <cf df f>8 <df f>16 q  q8 <cf df>16 cf  <bf df>8 q |
  s4. bf8\noBeam af af |
  <af c>8 s4. s4 |
  
  \barNumberCheck 25
  s4. <gf' bf>8\noBeam <f af> <gf bf> |
  <cf df>8 q16 q  q8 q16 cf  <bf df>8 q |
  <f af df>4 s8 <gf bf>\noBeam <f af>8 q |
  s2. * 5 |
  
  \barNumberCheck 33
  s2. * 6 |
  bf,8-. bf16-. bf-.  bf8-. bf-. bf[-. bf]-. |
  s2. |
  
  \barNumberCheck 41
  s2. * 2 |
  \moveAccidentalA ef!8 ef16( ef  ef8 ef ef ef) |
  s2. * 5 |
  
  \barNumberCheck 49
  s2. * 8 |
  
  \barNumberCheck 57
  s2. * 8 |
  
  \barNumberCheck 65
  % like 17 (4 bars)
  s2. * 3 |
  s4 r8 af,( gf) s |
  \key b \major 
  s2. * 4 |
  
  \barNumberCheck 73
  s2. * 3 |
  s8 e' s2 |
  s2. * 4 |
  
  \barNumberCheck 81
  s2. * 3 |
  s8 as,\arpeggio s2 |
  s2. * 4 |
  
  \barNumberCheck 89
  s2. * 3 |
  s8 as\arpeggio s2 |
  s2. * 4 |
  
  \barNumberCheck 97
  s2. * 3 |
  s8 as\arpeggio s2 |
  s8 ds ds4 css8 s |
  s8 ds ds4 css8 s |
  s4 \clef bass <b, ds>2 |
  <bf f'>2. |
  \key ef \minor
  
  \barNumberCheck 105
  s2. * 8 |
  
  \barNumberCheck 113
  s2. * 8 |
  
  \barNumberCheck 121
  % like 17 (4 bars)
  s2. * 3 |
  \clef treble
  s4 r8 af'( gf) s |
  % like 21
  <f af>4-. s8 bf-. af[-. bf]-. |
  <cf df f>8 <df f>16 q  q8 <cf df>16 cf  <bf df>8 q |
  s4. bf8\noBeam af af |
  <af c>8 s4. s4 |
  
  \barNumberCheck 129
  % like 25
  s4. <gf' bf>8\noBeam <f af> <gf bf> |
  <cf df>8 q16 q  q8 q16 cf  <bf df>8 q |
  <f af df>4 s8 <gf bf>\noBeam <f af>8 q |
  s2. * 5 |
  
  \barNumberCheck 137
  % like 33
  s2. * 6 |
  bf,8-. bf16-. bf-.  bf8-. bf-. bf[-. bf]-. |
  s2. |
  
  \barNumberCheck 145
  % like 41
  s2. * 2 |
  \moveAccidentalA ef!8 ef16( ef  ef8 ef ef ef) |
  s2. * 5 |
  
  \barNumberCheck 153
  s2. * 8 |
  
  \barNumberCheck 161
  s2. * 8 |
  
  \barNumberCheck 169
  s2. * 6 |
  s4 r8 af,( gf) s |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  \repeat volta 2 {
    \voiceThree 
    s2. * 8 |
    
    \barNumberCheck 9
    s2. * 3 |
    \clef treble ef8 ef'  gf,[ ef']  bf ef |
    a,8 ef'  af,[ d]  gf, bf |
    a8 ef'  af,[ d]  gf, bf |
    a8 <c ef f>  bf[ <df! ef g>]  cf ef |
    d8 f  ef[ gf]  bf, gf' |
    
    \barNumberCheck 17
    d8 af'  ef[ gf]  bf, gf' |
    d8 af'  ef[ gf]  df <ff g bf> |
    cf8 ef!  bf[ ef]  af, \tag layout { <ef' f cf'> } 
      \tag midi { <ef f cf'>16. r32 } |
    s2. |
  }
  s2. * 2 |
  s4. df,8\noBeam df df |
  s2. |
  
  \barNumberCheck 25
  s4. df'8\noBeam df df |
  r8 <f, af df f>16_. q_.  q8_. q16_. q_.  s4 |
  s2. * 6 |
  
  \barNumberCheck 33
  <ef! gf!>2~->\arpeggio q8 e[( |
  f8]) s8 s2 |
  s2 s8 e[( |
  f8]) s8 s2 |
  s2. * 4 |
  
  \barNumberCheck 41
  s2. * 8 |
  
  \barNumberCheck 49
  s2. * 8 |
  
  \barNumberCheck 57
  % like bar 9
  s2. * 3 |
  \clef treble ef8 ef'  gf,[ ef']  bf ef |
  a,8 ef'  af,[ d]  gf, bf |
  a8 ef'  af,[ d]  gf, bf |
  a8 <c ef f>  bf[ <df! ef g>]  cf ef |
  d8 f  ef[ gf]  bf, gf' |
  
  \barNumberCheck 65
  % like 17 (4 bars)
  d8 af'  ef[ gf]  bf, gf' |
  d8 af'  ef[ gf]  df <ff g bf> |
  cf8 ef!  bf[ ef]  af, \tag layout { <ef' f cf'> } 
      \tag midi { <ef f cf'>16. r32 } |
  s2. |
  \key b \major
  s2. * 4 |
  
  \barNumberCheck 73
  s2. * 8 |
  
  \barNumberCheck 81
  s2. * 3 |
  s4 fs,2_~ |
  \hideNoteHead fs4 s2 |
  s2. * 3 |
  
  \barNumberCheck 89
  s2. * 3 |
  s4 fs2 |
  s2. * 4 |
  
  \barNumberCheck 97
  s2. * 4 |
  s8 gs gs2 |
  s8 gs gs2 |
  s2. * 2 |
  \key ef \minor |
  
  \barNumberCheck 105
  s2. * 8 |
  
  \barNumberCheck 113
  % like bar 9
  s2. * 3 |
  \clef treble ef8 ef'  gf,[ ef']  bf ef |
  a,8 ef'  af,[ d]  gf, bf |
  a8 ef'  af,[ d]  gf, bf |
  a8 <c ef f>  bf[ <df! ef g>]  cf ef |
  d8 f  ef[ gf]  bf, gf' |
  
  \barNumberCheck 121
  % like 17 (4 bars)
  d8 af'  ef[ gf]  bf, gf' |
  d8 af'  ef[ gf]  df <ff g bf> |
  cf8 ef!  bf[ ef]  af, \tag layout { <ef' f cf'> } 
      \tag midi { <ef f cf'>16. r32 } |
  s2. |
  % like 21
  s2. * 2 |
  s4. df,8\noBeam df df |
  s2. |
  
  \barNumberCheck 129
  % like 25
  s4. df'8\noBeam df df |
  r8 <f, af df f>16_. q_.  q8_. q16_. q_.  s4 |
  s2. * 6 |
  
  \barNumberCheck 137
  % like 33
  <ef! gf!>2~->\arpeggio q8 e[( |
  f8]) s8 s2 |
  s2 s8 e[( |
  f8]) s8 s2 |
  s2. * 4 |
  
  \barNumberCheck 145
  s2. * 8 |
  
  \barNumberCheck 153
  s2. * 8 |
  
  \barNumberCheck 161
  % like bar 57 and 9
  s2. * 3 |
  \clef treble ef8 ef'  gf,[ ef']  bf ef |
  a,8 ef'  af,[ d]  gf, bf |
  a8 ef'  af,[ d]  gf, bf |
  a8 <c ef f>  bf[ <df! ef g>]  cf ef |
  d8 f  ef[ gf]  bf, gf' |
  
  \barNumberCheck 169
  % like 65 and 17 (3 bars)
  d8 af'  ef[ gf]  bf, gf' |
  d8 af'  ef[ gf]  df <ff g bf> |
  cf8 ef!  bf[ ef]  af, <ef' f cf'> |
}

leftHandLower = \relative {
  \repeat volta 2 {
    bf,16( cf a bf ef,8) r r <ef bf'>16-.( q |
    q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
    bf'16( cf a bf ef,8) r r <ef af ef'>16-.( q |
    q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
    cf'16( df bf cf  ef,8) r r <ef af ef'>16-.( q |
    q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
    cf'16( df bf cf  ef,8)\noBeam <ef af cf ef>16-. q-.  q8-. q16-. q-. |
    q8\noBeam <ef' af cf ef>16-. q-.  q8-. q16-. q-.  q8-. q16-. q-. |
    
    \barNumberCheck 9
    <d, d'>8\noBeam <d' f bf>16 q  q8-. q16 q  <df ef g bf>8-. q16 q |
    <cf ef bf'>8-. q16 q  q8-.\noBeam q-^ <cf ef af>-^ <cf ef a>-^ |
    <bf ef gf bf>8_\sfMarkup\noBeam \clef treble <bf' ef gf bf>16 q  q8-. q-. 
      <bf d af' bf>-. q-. |
    \voiceTwo ef,4*1/2 gf'  gf, gf'  bf, gf' |
    a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
    a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
    a,4*1/2 \moveNoteA f' bf, \moveNoteB ef cf af'! |
    d,4*1/2 bf' ef, bf' bf, \stemLengthB bf'8 |
    
    \barNumberCheck 17
    d,4*1/2 cf' ef, cf'-> bf, \stemLengthB bf'8 |
    d,4*1/2 cf' ef, cf'-> df, \moveNoteB g |
    cf,4*1/2 af' bf, bf' af, \tag layout { \moveNoteB f'8 } 
      \tag midi { f16. r32 }|
    \lowerFermataOverBarLine
    \clef bass \oneVoice <bf,, af'>8 r r bf[( ef,]) r |
  }
  <df df'>4-_ r8 <gf df'>-. <df df'>[-. <gf df'>]-. |
  <df df'>8\noBeam <df' af' cf>16-. q-.  q8-. <df af'>16-. q-.  <gf, gf'>8-.
    bf-. |
  df4-_ r8 \voiceTwo gf,-.\noBeam  df-. f16-. gf-. |
  \oneVoice af8-.\noBeam <af af'>16-. q-.  q8-. q16-. q-.  <df af'>8-. q-. |
  
  \barNumberCheck 25
  q4-.-^ r8 \voiceTwo gf-.\noBeam df-. gf-. |
  <df, df'>2 \oneVoice <gf gf'>8-. <bf bf'>-. |
  \oneVoice <df df'>4-.-^ r8 <gf df'>-.  <df, df'>-. <f f'>16-. <gf gf'>-. |
  <af af'>8-.\noBeam <ef' af c>16-. q-.  q8-. q16-. q-.  <df af' df>8-.
    <df, df'>-. |
  <cs cs'>8( <ds ds'> <e e'>)\noBeam <e' a cs>16-. q-.  q8-. q-. |
  <e b' d>8-. <e b' d e>16-. q-.  q8-. q16-. q-.  <a cs e>8-. <a, a'>-. |
  <a, a'>8( <bf! bf'!> <c c'>-.)\noBeam <c' a' c>16-. q-.  q8-. q16-. q-. |
  <c g' bf c>8-. q16-. q-.  q8-. q16-. q-.  <f a c>8-. <f, f'>-. |
  
  \barNumberCheck 33
  \voiceTwo f8-.\arpeggio f16-. f-. f8-. f-. f[-. f]-. |
  f8\noBeam \oneVoice <f gf'!>16-.-> <f f'>-.  <f e'>8-. <f f'>16-.-> <f e'>-.
    <f ef'>8-. <f d'>16-.-> <f df'>-. |
  <f c'>8-.\noBeam \voiceTwo <f ef' gf>16-.\arpeggio <f gf'>-.  q8-. q-. 
    q-.[ f-.] |
  f8-.\noBeam \oneVoice <f gf'!>16-.-> <f f'>-.  <f e'>8-. <f f'>16-.-> 
    <f e'>-.  <f ef'>8-. <f d'>16-.-> <f df'>-. |
  % accent, second beat first 16th, instead of second 16th
  <f c'>8-. <f f'>16-.-> <f e'>-.  <f ef'>8-. <f ff'>16-.-> <f ef'>-. 
    <f d'>8-. <f df'>16-.-> <f c'>-. |
  <f bf>8-. <f ef'>16-.-> <f d'>-.  <f df'>8-. <f ef'>16-.-> <f df'>-.
    <f c'>8-. <f bf>16-.-> <f c'>-. |
  <f df'>8-. q16-. q-.  q8-. q-. q[-. <f df' e>]-. |
  <f c' f>8 r r4 r |
  
  \barNumberCheck 41
  <f' f'>2.-> |
  <e e'>2.-> |
  ef!8 ef16( ef  ef8 ef ef ef) |
  a,4( bf) r |
  cf!4( d,) r |
  cf'4( d,) r |
  cf'4-\slurShapeE ( d, cf' |
  d,4) r r |
  
  \barNumberCheck 49
  % like bar 1
  bf'16( cf a bf ef,8) r r <ef bf'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  bf'16( cf a bf ef,8) r r <ef af ef'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  cf'16( df bf cf  ef,8) r r <ef af ef'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  cf'16( df bf cf  ef,8)\noBeam <ef af cf ef>16-. q-.  q8-. q16-. q-. |
  q8\noBeam <ef' af cf ef>16-. q-.  q8-. q16-. q-.  q8-. q16-. q-. |
  
  \barNumberCheck 57
  % like bar 9
  <d, d'>8\noBeam <d' f bf>16 q  q8-. q16 q  <df ef g bf>8-. q16 q |
  <cf ef bf'>8-. q16 q  q8-.\noBeam q-^ <cf ef af>-^ <cf ef a>-^ |
  <bf ef gf bf>8_\sfMarkup\noBeam \clef treble <bf' ef gf bf>16 q  q8-. q-. 
    <bf d af' bf>-. q-. |
  \voiceTwo ef,4*1/2 gf'  gf, gf'  bf, gf' |
  a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
  a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
  a,4*1/2 \moveNoteA f' bf, \moveNoteB ef cf af'! |
  d,4*1/2 bf' ef, bf' bf, \stemLengthB bf'8 |
  
  \barNumberCheck 65
  % like 17 (4 bars)
  d,4*1/2 cf' ef, cf'-> bf, \stemLengthB bf'8 |
  d,4*1/2 cf' ef, cf'-> df, \moveNoteB g |
  cf,4*1/2 af' bf, bf' af, \tag layout { \moveNoteB f'8 } 
      \tag midi { f16. r32 }|
  \lowerFermataOverBarLine
  \clef bass \oneVoice <bf,, af'>8 r r bf[( ef,]) r |
  \key b \major
  \stemUp b'4 r8 b-.  e-. b16.-. <b gs'>32-. |
  <b fs'>8-. b-. r b-.  b-. b16.-. b32-. |
  b8-. b-. r <b fs'>16( q q8 <b es> |
  <as fs'>8 q16 q  <as es'>8 q <fs fs'>4^\ten |
  
  \barNumberCheck 73
  <b fs'>4-.) r8 b-.  e-. b16.-. <b gs'>32-. |
  <b fs'>8-. b-. r gs-.  cs-. gs16.-. <gs e'>32-. |
  <gs ds'>8-. gs-. r  \stemDown <gs' b>16( q  q8 <g b> |
  q8 <fs as> q4-> <b, b'>8) r |
  \stemUp <b fs'>4-. r8 b-.  e-. b16.-. <b gs'>32-. |
  <b fs'>8-. b-. r <b, b'>8-.  q-. q16.-. q32-. |
  q8-. q-. r b'16( b  b8 ds |
  ds8 ds16 ds  ds8 fs-. <fs,, fs'>4^\ten |
  
  \barNumberCheck 81
  <b b'>4-.) r8 \stemNeutral <b' a'>-.  q-. q16.-. q32-. |
  q8-. q-. r b-.\( <e, b'>8^>( q16.-.) q32-. |
  <b b'>8-. q-.\) r gs''16_( gs  gs8 <g, g'> |
  q8 <fs fs'> \voiceTwo <fs' as>4^> <b, b'> |
  <ds fs as>4-.) \oneVoice r8 ds-.  gs-. ds16.-. <ds b'>32-. |
  <ds as'>8-. ds-. r ds-.  gs,-. as16.-. <as gs'>32-. |
  <ds fs>8-. ds-. r ds16_( ds  ds8 ds16 ds |
  ds8 ds16 ds  ds8 fs  <fs,, fs'>4^\ten |
  
  \barNumberCheck 89
  % like 81 (4 bars)
  <b b'>4-.) r8 \stemNeutral <b' a'>-.  q-. q16.-. q32-. |
  q8-. q-. r b-.\( <e, b'>8^>( q16.-.) q32-. |
  <b b'>8-. q-.\) r gs''16_( gs  gs8 <g, g'> |
  q8 <fs fs'> \voiceTwo <fs' as>4^> <b, b'> |
  \oneVoice <ds, ds'>4-.) r8 q-.  <gs ds'>8-. <ds ds'>16.-. <ds' b'>32-. |
  <ds as'>8-. ds-. r <ds, ds'>-.  <gs ds'>-. <ds ds'>16.-. <as' gs'>32-. |
  <ds fs>8-. ds-. r <ds, ds'>16_( q  q8 ds'16 ds |
  ds8 ds16 ds  ds8 fs  <fs,, fs'>4^\ten |
  
  \barNumberCheck 97
  \repeat tremolo 12 { b32)_\pp b' } |
  <b, b'>8-.( q-.) r q-.\(  <e b'>^>( q16.-.) <e as!>32-. |
  <ds as'>8-. gs-.\) r <gs gs'>16_( q  q8 <g g'> |
  q8 <fs fs'>  <fs' as>4_~ <b, fs' b>8) r |
  r8 \voiceTwo es( es4. as,8) |
  d8\rest es( es4. as,8) |
  \oneVoice r4 <fs, fs'>( b |
  <d, d'>2.)_\fermata |
  \key ef \minor
  
  \barNumberCheck 105
  % like bar 1
  bf''16( cf a bf ef,8) r r <ef bf'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  bf'16( cf a bf ef,8) r r <ef af ef'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  cf'16( df bf cf  ef,8) r r <ef af ef'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  cf'16( df bf cf  ef,8)\noBeam <ef af cf ef>16-. q-.  q8-. q16-. q-. |
  q8-.\noBeam <ef' af cf ef>16-. q-.  q8-. q16-. q-.  q8-. q16-. q-. |
  
  \barNumberCheck 113
  % like bar 9
  <d, d'>8\noBeam <d' f bf>16 q  q8-. q16 q  <df ef g bf>8-. q16 q |
  <cf ef bf'>8-. q16 q  q8-.\noBeam q-^ <cf ef af>-^ <cf ef a>-^ |
  <bf ef gf bf>8\noBeam \clef treble <bf' ef gf bf>16 q  q8-. q-. 
    <bf d af' bf>-. q-. |
  \voiceTwo ef,4*1/2 gf'  gf, gf'  bf, gf' |
  a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
  a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
  a,4*1/2 \moveNoteA f' bf, \moveNoteB ef cf af'! |
  d,4*1/2 bf' ef, bf' bf, \stemLengthB bf'8 |
  
  \barNumberCheck 121
  % like 17 (4 bars)
  d,4*1/2 cf' ef, cf'-> bf, \stemLengthB bf'8 |
  d,4*1/2 cf' ef, cf'-> df, \moveNoteB g |
  cf,4*1/2 af' bf, bf' af, \tag layout { \moveNoteB f'8 } 
      \tag midi { f16. r32 }|
  \lowerFermataOverBarLine
  \clef bass \oneVoice <bf,, af'>8 r r bf[( ef,]) r |
  % like 21
  <df df'>4-_ r8 <gf df'>-. <df df'>[-. <gf df'>]-. |
  <df df'>8-.\noBeam <df' af' cf>16-. q-.  q8-. <df af'>16-. q-.  <gf, gf'>8-.
    bf-. |
  df4-_ r8 \voiceTwo gf,-.\noBeam  df-. f16-. gf-. |
  \oneVoice af8-.\noBeam <af af'>16-. q-.  q8-. q16-. q-.  <df af'>8-. q-. |
  
  \barNumberCheck 129
  % like 25
  q4-.-^ r8 \voiceTwo gf-.\noBeam df-. gf-. |
  <df, df'>2 \oneVoice <gf gf'>8-. <bf bf'>-. |
  \oneVoice <df df'>4-.-^ r8 <gf df'>-.  <df, df'>-. <f f'>16-. <gf gf'>-. |
  <af af'>8-.\noBeam <ef' af c>16-. q-.  q8-. q16-. q-.  <df af' df>8-.
    <df, df'>-. |
  <cs cs'>8( <ds ds'> <e e'>)\noBeam <e' a cs>16-. q-.  q8-. q-. |
  <e b' d>8-. <e b' d e>16-. q-.  q8-. q16-. q-.  <a cs e>8-. <a, a'>-. |
  <a, a'>8( <bf! bf'!> <c c'>-.)\noBeam <c' a' c>16-. q-.  q8-. q16-. q-. |
  <c g' bf c>8-. q16-. q-.  q8-. q16-. q-.  <f a c>8-. <f, f'>-. |
  
  \barNumberCheck 137
  % like 33
  \voiceTwo f8-.\arpeggio f16-. f-. f8-. f-. f[-. f]-. |
  f8\noBeam \oneVoice <f gf'!>16-.-> <f f'>-.  <f e'>8-. <f f'>16-.-> <f e'>-.
    <f ef'>8-. <f d'>16-.-> <f df'>-. |
  <f c'>8-.\noBeam \voiceTwo <f ef' gf!>16->-.\arpeggio <f gf'>-.  q8-. q-. 
    q-.[ f-.] |
  f8-.\noBeam \oneVoice <f gf'!>16-.-> <f f'>-.  <f e'>8-. <f f'>16-.-> 
    <f e'>-.  <f ef'>8-. <f d'>16-.-> <f df'>-. |
  <f c'>8-. <f f'>16-.-> <f e'>-.  <f ef'>8-. <f ff'>16-.-> <f ef'>-. 
    <f d'>8-. <f df'>16-.-> <f c'>-. |
  <f bf>8-. <f ef'>16-.-> <f d'>-.  <f df'>8-. <f ef'>16-.-> <f df'>-.
    <f c'>8-. <f bf>16-.-> <f c'>-. |
  <f df'>8-. q16-. q-.  q8-. q-. q[-. <f df' e>]-. |
  <f c' f>8 r r4 r |
  
  \barNumberCheck 145
  % like 41
  <f' f'>2.-> |
  <e e'>2.-> |
  ef!8 ef16( ef  ef8 ef ef ef) |
  a,4( bf) r |
  cf!4( d,) r |
  cf'4( d,) r |
  cf'4-\slurShapeF ( d, cf' |
  d,4) r r |
  
  \barNumberCheck 153
  % like bar 49 and 1
  bf'16( cf a bf ef,8) r r <ef bf'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  bf'16( cf a bf ef,8) r r <ef af ef'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  cf'16( df bf cf  ef,8) r r <ef af ef'>16-.( q |
  q8-. q16-. q -.  q8-. q16-. q-. q8-.) r |
  cf'16( df bf cf  ef,8)\noBeam <ef af cf ef>16-. q-.  q8-. q16-. q-. |
  q8\noBeam <ef' af cf ef>16-. q-.  q8-. q16-. q-.  q8-. q16-. q-. |
  
  \barNumberCheck 161
  % like bar 57 and 9
  <d, d'>8\noBeam <d' f bf>16 q  q8-. q16 q  <df ef g bf>8-. q16 q |
  <cf ef bf'>8-. q16 q  q8-.\noBeam q-^ <cf ef af>-^ <cf ef a>-^ |
  <bf ef gf bf>8\noBeam \clef treble <bf' ef gf bf>16 q  q8-. q-. 
    <bf d af' bf>-. q-. |
  \voiceTwo ef,4*1/2 gf'  gf, gf'  bf, gf' |
  a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
  a,4*1/2 \moveNoteB f' af, f' gf, \stemLengthA <ef' gf>8 |
  a,4*1/2 \moveNoteA f' bf, \moveNoteB ef cf af'! |
  d,4*1/2 bf' ef, bf' bf, \stemLengthB bf'8 |
  
  \barNumberCheck 169
  % like 65 and 17 (3 bars)
  d,4*1/2 cf' ef, cf'-> bf, \stemLengthB bf'8 |
  d,4*1/2 cf' ef, cf'-> df, \moveNoteB g |
  cf,4*1/2 af' bf, bf' af, \moveNoteB f'8 |
  \clef bass \oneVoice <bf,, f' af>4 r8 q[-. <bf, bf'>]-. r |
  \once \override Score.TextMark.Y-offset = 3
  \lowerFermataOverBarLine
  <bf' gf' a>4 r8 q[-. <bf, bf'>]-. r |
  \lowerFermataOverBarLine
  R2. |
  r4 r8 q[( <ef, ef'>]) r |
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override TextScript.Y-offset = -0.5
  \override TextSpanner.Y-offset = -0.5
  \override Hairpin.after-line-breaking = ##f
  \override Hairpin.to-barline = ##f
  \repeat volta 2 {
    s2.\pp |
    s2. |
    s2 s8 s\pocoCresc |
    s2 s8 s\! |
    s2\pp s8 s\pocoCresc |
    s2 s8 s\! |
    s4.\f s^\moltoCresc |
    s8 s\< s4. s16 s\! |
    
    \barNumberCheck 9
    s2.\ff |
    s4 s4....\< s64\! |
    s2.\fff |
    s2.\fp |
    s4\< s8\! s\> s8 s16\! s16\< |
    s8. s16\! s8 s\> s8 s16\! s\< |
    s2. |
    s4 s8. s16\! s4^\piuF |
    
    \barNumberCheck 17
    \override Hairpin.Y-offset = -1.5
    s4. s8\> s s16\! s\< |
    s8. s16\! s8 s8.\> s8\! s16\< |
    s2 s8. s16\! |
    \revert Hairpin.Y-offset
    s2.-\tweak extra-offset #'(0 . -1.5) \p |
  }
  s2.\ppStacc
  s2. * 3 |
  
  \barNumberCheck 25
  s2.\cresc |
  s2 s8 s\! |
  \piuFSpanner s2.\startTextSpan |
  s2 s8 s\stopTextSpan |
  s4.\ff s8\f s \crescSpanner s\startTextSpan |
  s2 s8 s\stopTextSpan |
  s4.\ff s8\f s4\cresc |
  s2 s8 s\! |
  
  \barNumberCheck 33
  % decrescendo on last eighth, consitency
  s2\ff s8 s\sf\> |
  s8\! s\f s2 |
  s8 s4.\ff s8 s\sf\> |
  s8\! s8\f s2 |
  s2. * 2 |
  s2.\ff |
  s8\sf s\dim s4.\> s8\! |
  
  \barNumberCheck 41
  s2.-\tweak Y-offset 2 \p |
  s4 s2\dim |
  s2. |
  s4 s2\! |
  s2.-\tweak Y-offset 1.5 \pp |
  s2. * 3 |
  
  \barNumberCheck 49
  % like bar 1
  s2.^\sotoVoce |
  s2. |
  s2 s8 s^\poco |
  s2\cresc s8 s\! |
  s2\p s8 s\piuCresc |
  s2 s8 s\! |
  s4.\f s^\moltoCresc |
  s2\< s8. s16\! |
  
  \barNumberCheck 57
  % like bar 9
  s2.\ff |
  s4 s4....\< s64\! |
  s2.\fff |
  s2.\fp |
  s4\< s8\! s\> s8 s16\! s16\< |
  s8. s16\! s8 s\> s8 s16\! s\< |
  s2. |
  s4 s8. s16\! s4^\piuF |
  
  \barNumberCheck 65
  % like 17 (4 bars)
  s4. s8\> s s16\! s\< |
  s8. s16\! s8 s8.\> s8\! s16\< |
  s2 s8. s16\! |
  s2.\p |
  % key of b major
  s2.-\tweak Y-offset -1 ^\sotoVoce |
  s2. |
  s4. s\< |
  s4 s\! s\> |
  
  \barNumberCheck 73
  s8\! s^\sotoVoce s2 |
  s2. |
  s4. s\< |
  s8. s16\! s4\> s8\! s |
  s2. * 2 |
  s2 s4\< |
  s4 s8\! s s4\> |
  
  \barNumberCheck 81
  s8.\! s16^\sotoVoce s2 |
  s2. |
  s4. s\< |
  s8. s16\! s4\> s\! |
  s2.^\semprePp |
  s2. |
  s4. s\< |
  s4 s8\! s s4\> |
  
  \barNumberCheck 89
  s4\! s2 |
  s2. |
  s4. s\< |
  s8. s16\! s4\> s\! |
  s2. * 2 |
  s4. s\< |
  s4 s8\! s s4\> |
  
  \barNumberCheck 97
  s4\! s2 |
  s2. |
  s4. s\< |
  s8. s16\! s4\> s\! |
  s4 s\> s\! |
  s4 s\> s\! |
  s4 s4.\< s8\! |
  s2.\pp |
  
  \barNumberCheck 105
  % like bar 1
  s2.\pp |
  s2. |
  s2 s8 s\pocoCresc |
  s2 s8 s\! |
  s2\p s8 s\piuCresc |
  s2 s8 s\! |
  s4.\f s^\moltoCresc |
  s8 s\< s4. s16 s\! |
  
  \barNumberCheck 113
  % like bar 9
  s2.\ff |
  s4 s4....\< s64\! |
  s2.\fff |
  s2.\fp |
  s4\< s8\! s\> s8 s16\! s16\< |
  s8. s16\! s8 s\> s8 s16\! s\< |
  s2. |
  s4 s8. s16\! s4^\piuF |
  
  \barNumberCheck 121
  % like 17 (4 bars)
  s4. s8\> s s16\! s\< |
  s8. s16\! s8 s8.\> s8\! s16\< |
  s2 s8. s16\! |
  s2.\p |
  % like 21
  s2.\ppStacc
  s2. * 3 |
  
  \barNumberCheck 129
  % like 25
  s2.\cresc |
  s2 s8 s\! |
  \piuFSpanner s2.\startTextSpan |
  s2 s8 s\stopTextSpan |
  s4.\ff s8\f s \crescSpanner s\startTextSpan |
  s2 s8 s\stopTextSpan |
  s4.\ff s8\p s4\cresc |
  s2 s8 s\! |
  
  \barNumberCheck 137
  % like 33
  s2\ff s8 s\sf\> |
  s8\! s\f s2 |
  s8 s4.\ff s8 s\sf\> |
  s8\! s8\f s2 |
  s2. * 2 |
  s2.\ff |
  s8\sf s\dim s4.\> s8\! |
  
  \barNumberCheck 145
  % like 41
  s2.-\tweak Y-offset 2 \p |
  s4 s2\dim |
  s2. |
  s4 s2\! |
  s2.\pp |
  s2. * 3 |
  
  \barNumberCheck 153
  % like bar 49 and 1
  s2.^\sotoVoce |
  s2. |
  s2 s8 s\pocoCresc |
  s2 s8 s\! |
  s2\p s8 s\piuCresc |
  s2 s8 s\! |
  s4.\f s^\moltoCresc |
  s2\< s8. s16\! |
  
  \barNumberCheck 161
  % like bar 57 and 9
  s2.\ff |
  s4 s4....\< s64\! |
  s2.\fff |
  s2.\fp |
  s4\< s8\! s\> s8 s16\! s16\< |
  s8. s16\! s8 s\> s8 s16\! s\< |
  s2. |
  s4 s8. s16\! s4^\piuF |
  
  \barNumberCheck 169
  % like 65 and 17 (3 bars)
  s4. s8\> s s16\! s\< |
  s8. s16\! s8 s8.\> s8\! s16\< |
  s2 s8. s16\! |
  \override DynamicTextSpanner.style = #'none
  s4\cresc s4.\< s8\! |
  s4^\piuF s4.\< s8\! |
  s16 s8.\ff s4 s16 s8.\pp |
  s4 s2\ppp |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \repeat volta 2 {
    \tempo "Maestoso." 4 = 100
    s2. |
    \tempo 4 = 88
    s2. |
    \tempo 4 = 100
    s2. |
    \tempo 4 = 88
    s2. |
    \tempo 4 = 100
    s2. |
    \tempo 4 = 88
    s2. |
    \tempo 4 = 100
    s2. * 2 |
    
    \barNumberCheck 9
    s2. * 8 |
    
    \barNumberCheck 17
    s2. * 2 |
    s2 s8 s16. \tempo 4 = 10 s32 |
    \tempo 4 = 88
    s2. |
  }
  \tempo 4 = 100
  s2. * 4 |
  
  \barNumberCheck 25
  s2. * 8 |
  
  \barNumberCheck 33
  s2. * 8 |
  
  \barNumberCheck 41
  s2. * 2 |
  \tempo 4 = 92
  s2. * 2 |
  \tempo 4 = 84
  s2. * 2 |
  \tempo 4 = 76
  s2. * 2 |
  
  \barNumberCheck 49
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 57
  s2. * 8 |
  
  \barNumberCheck 65
  s2. * 2 |
  s2 s8 s16. \tempo 4 = 10 s32 |
  \tempo 4 = 100
  s2. |
  \tempo "Meno mosso." 4 = 92
  s2. * 4 |
  
  \barNumberCheck 73
  s2. * 8 |
  
  \barNumberCheck 81
  s2. * 8 |
  
  \barNumberCheck 89
  s2. * 8 |
  
  \barNumberCheck 97
  s2. * 4 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 84
  s2. |
  \tempo "Adagio." 4 = 66
  s2. * 2 |
  
  \barNumberCheck 105
  \tempo "Tempo I" 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 113
  s2. * 8 |
  
  \barNumberCheck 121
  s2. * 2 |
  s2 s8 s16. \tempo 4 = 10 s32 |
  \tempo 4 = 100
  s2. * 5 |
  
  \barNumberCheck 129
  s2. * 8 |
  
  \barNumberCheck 137
  s2. * 8 |
  
  \barNumberCheck 145
  s2. * 2 |
  \tempo 4 = 92
  s2. * 2 |
  \tempo 4 = 84
  s2. * 2 |
  \tempo 4 = 76
  s2. * 2 |
  
  \barNumberCheck 153
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 88
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 161
  s2. * 8 |
  
  \barNumberCheck 169
  s2. * 3 |
  s2 s8 \tempo 4 = 40 s |
  \tempo 4 = 100
  s2 s8 \tempo 4 = 40 s |
  \tempo 4 = 60
  s2. |
  \tempo "Lento" 4 = 40
  s2. |
}

pedal = {
  \repeat volta 2 {
    s2 s8 s\sd |
    s2 s4\su |
    s2 s8 s\sd |
    s2 s4\su |
    s2 s8 s\sd |
    s2 s4\su |
    s4. s\sd |
    s2 s8. s16\su |
    
    \barNumberCheck 9
    s4..\sd s16\su s8.\sd s16\su |
    s4\sd s16 s8.\su s4 |
    s4-\tweak Y-offset -1 \sd s16 s8.\su s4 |
    s4-\tweak Y-offset -3 \sd s2-\tweak Y-offset -1 \su |
    s2. * 4 |
    
    \barNumberCheck 17
    s2. * 4 |
  }
  s2. * 4 |
  
  \barNumberCheck 25
  s2. |
  s4-\tweak Y-offset -2 \sd s8. s16\su s4 |
  s2. * 2 |
  s4 s4.\sd s8\su |
  s2. |
  s4 s4.\sd s16 s\su |
  s2. |
  
  \barNumberCheck 33
  s2\sd s4\su |
  s2. |
  s8 s\sd s4 s\su |
  s2. * 5 |
  
  \barNumberCheck 41
  s2. * 8 |
  
  \barNumberCheck 49
  % like bar 1
  s2 s8 s\sd |
  s2 s4\su |
  s2 s8 s\sd |
  s2 s4\su |
  s2 s8 s\sd |
  s2 s4\su |
  s4. s8\sd s4 |
  s2 s8. s16\su |
  
  \barNumberCheck 57
  % like bar 9
  s4..\sd s16\su s8.\sd s16\su |
  s4\sd s16 s8.\su s4 |
  s4\sd s16 s8.\su s4 |
  s4-\tweak Y-offset -2 \sd s2-\tweak Y-offset -1 \su |
  s2. * 4 |
  
  \barNumberCheck 65
  s2. * 4 |
  % key of b major
  s2. * 3 |
  s2 s4\sd |
  
  \barNumberCheck 73
  s4\su s2 |
  s2. * 6 |
  s4.\sd s8\su s4\sd |
  
  \barNumberCheck 81
  s4\su s2 |
  s2. * 2 |
  s8 s\sd s4 s\su |
  s2. * 2 |
  s4. s\sd |
  s4. s8\su s4\sd |
  
  \barNumberCheck 89
  s4\su s2 |
  s2. * 2 |
  s8 s\sd s4 s\su |
  s2. * 2 |
  s4. s\sd |
  s4. s8\su s8\sd s\su |
  
  \barNumberCheck 97
  s2.-\tweak Y-offset -2 \sd |
  s8 s\su s2 |
  s2. |
  s8 s\sd s4 s\su |
  s2. * 4 |
  
  \barNumberCheck 105
  % like bar 1
  s2 s8 s\sd |
  s2 s4\su |
  s2 s8 s\sd |
  s2 s4\su |
  s2 s8 s\sd |
  s2 s4\su |
  s4. s\sd |
  s2 s8. s16\su |
  
  \barNumberCheck 113
  % like bar 9
  s4..\sd s16\su s8.\sd s16\su |
  s4\sd s16 s8.\su s4 |
  s4\sd s16 s8.\su s4 |
  s4\sd s2\su |
  s2. * 4 |
  
  \barNumberCheck 121
  s2. * 8 |
  
  \barNumberCheck 129
  % like 25
  s2. |
  s4\sd s8. s16\su s4 |
  s2. * 2 |
  s4 s4.\sd s8\su |
  s2. |
  s4 s4.\sd s16 s\su |
  s2. |
  
  \barNumberCheck 137
  % like 33
  s2\sd s4\su |
  s2. |
  s8 s\sd s4 s\su |
  s2. * 5 |
  
  \barNumberCheck 145
  s2. * 8 |
  
  \barNumberCheck 153
  % like bar 49 and 1
  s2 s8 s\sd |
  s2 s4\su |
  s2 s8 s\sd |
  s2 s4\su |
  s2 s8 s\sd |
  s2 s4\su |
  s4. s8\sd s4 |
  s2 s8. s16\su |
  
  \barNumberCheck 161
  % like bar 57 and 9
  s4..\sd s16\su s8.\sd s16\su |
  s4\sd s16 s8.\su s4 |
  s4\sd s16 s8.\su s4 |
  s4\sd s2\su |
  s2. * 4 |
  
  \barNumberCheck 169
  s2. * 3 |
  s2\sd s8 s\su |
  s2\sd s8 s\su |
}

forceBreaks = {
  % page 1
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 2
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 3
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 4
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 5
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 6
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 7
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 8
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 5 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 4 { s2.\noBreak } s2.\pageBreak
  
  % page 9
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
}

polonaiseTwoNotes =
\score {
  \header {
    title = "Polonaise Two"
    composer = "Frédéric Chopin"
    opus = "Opus 26, No. 2"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \consists Span_arpeggio_engraver
    connectArpeggios = ##t
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Dynamics \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

polonaiseTwoMidi =
\book {
  \bookOutputName "polonaise-op26-no2"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
