%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"
\include "force-initial-clef.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . -1) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeB = \shape #'((0 . 1.5) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'((0 . -0.5) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeD = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0.5) (0 . 0.5) (0 . 0) (0 . 0))
                      ) \etc
slurShapeE = \shape #'((0 . 0) (0 . 0) (-3 . -1) (0 . 0)) \etc
slurShapeF = \shape #'((0 . 0) (0 . 0) (-3 . -2) (0 . 0)) \etc
slurShapeG = \shape #'((0 . 0) (0 . 0) (-3 . -1) (0 . 0)) \etc
slurShapeH = \shape #'(
                        ((0 . -2) (0 . 2) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeI = \shape #'((0 . 0) (0 . 0) (0 . 1) (0 . 0)) \etc
slurShapeJ = \shape #'(
                        ((0 . 0) (0 . -1) (0 . -1) (0 . 0))
                        ((0 . 0) (0 . -1) (0 . -1) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeK = \shape #'((0 . 0) (0 . -1.5) (0 . 0) (0 . 0)) \etc
slurShapeL = \shape #'((0 . 0.25) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeM = \shape #'(
                        ((0 . 0) (0 . -1) (0 . -1) (0 . 0))
                        ((0 . 0) (0 . -1) (0 . -1) (0 . 0))
                      ) \etc
slurShapeN = \shape #'((0 . 0) (0 . -1.5) (0 . 0) (0 . 0)) \etc
slurShapeO = \shape #'((0 . 0) (0 . 1) (0 . 1) (0 . 0)) \etc

moveTextA = \tweak X-offset 3 \etc
moveTextB = \tweak X-offset 1 \etc

rotateHairpinA = \once \override Hairpin.rotation = #'(15 -1 0)
rotateHairpinB = \once \override Hairpin.rotation = #'(6 -1 0)
rotateHairpinC = \once \override Hairpin.rotation = #'(8 -1 0)
rotateTupletA = \once {
  \override TupletBracket.rotation = #'(15 -1 0)
  \override TupletNumber.Y-offset = -4.5
}

beamPositionsA = \once \override Beam.positions = #'(5.75 . 5.25)

%%% Music %%%

global = {
  \time 3/4
  \key cs \minor
  \set Staff.extraNatural = ##f
}

rightHandUpper = \relative {
  \repeat volta 2 {
    \trebleToBass
    cs'32( <e, e'>8..) b'32( <e, e'>8..) a32( <e e'>8..) |
    gs32( <e e'>8..) fss32( <e e'>8..) r4 |
    \clef treble \stemUp <e'' as cs e>8. <e, as cs e>16 \stemNeutral 
      <e gs cs e>4-. <fs gs bs ds>-. |
    <e gs cs>4-. <cs' e gs cs>-. r8 gs( |
    ds'4. cs16 ds  es8 ds16 es |
    fs8 es16 fs  gs8 fs16 gs  a8 a,) |
    \omit TupletBracket
    gs4->~-\slurShapeA ( \tuplet 3/2 4 { gs8-. as-. bs-.  cs-. ds-. e-.) } |
    ds2.^\ten |
    
    \barNumberCheck 9
    \tuplet 3/2 { ds8\( ds ds }  ds cs16( ds  es8) ds16( es |
    fs8) es16( fs  gs8)^\pocoRit  fs16( gs  a8) gs16( a |
    \tuplet 3/2 4 { b8) a g  fs\mordent e! fs } \acciaccatura { fs } a, d\) |
    \voiceOne \tuplet 3/2 { cs8( bs e } ds4 cs8) \oneVoice r |
  }
  \repeat volta 2 {
    r8^\sotoVoce <gs, bs>4->^( q8 q q) |
    \subdivideEighths \tuplet 3/2 { fss16->[_(^\< \magnifyMusic #2/3 { as cs
      } } \magnifyMusic #2/3 { e32 fss as cs]\! } e8-.) <cs, fss>4^( 
      <bs gs'>8) |
    r8 <gs bs>4->^( q8 q q) |
    \rotateHairpinA a32->[_(^\< \magnifyMusic #2/3 { bs ds fs  a bs ds fs]\! } 
      a8-.) <bs,, a'>4^( <cs gs'>8) |
    
    \barNumberCheck 17
    r8 <gs cs>4->^( q8 q q) |
    \rotateHairpinA \stemUp as32[_(^\< \magnifyMusic #2/3 { cs e fss 
      \tuplet 6/4 { as cs e fss as cs]\! } } \stemNeutral e8-.) 
      <as,,, cs fss>4^( <gs bs gs'>8) |
    \rotateHairpinA \stemUp as32[_(^\< \magnifyMusic #2/3 { cs e fss 
      \tuplet 6/4 { as cs e fss as cs]\! } } \stemNeutral e8-.) 
      <as,,, cs fss>4^( <gs bs gs'>8) |
    \voiceOne ds''2.-^~ |
    ds8 \oneVoice ds4-> ds-> ds8-> |
    ds4( a' gs8 a16 gs |
    fs4 ds cs8 ds16 cs |
    b4 a' gs8 a16 gs |
    
    \barNumberCheck 25
    \omit TupletNumber
    fs4 ds \subdivideOff \tuplet 3/2 { cs16 ds cs } bs32 cs ds e |
    b!4)^\pocoRiten \clef bass a,( gs8 a16 gs |
    fs4 ds cs8 ds16 cs) |
    \ritardSpanner \after 8*5 \stopTextSpan b2.\startTextSpan |
    \grace { ass16[( bs] } \slashedGrace { cs8 } \afterGrace 15/16 bs2.)\trill
      { as16( bs) } |
    cs8-.^\aTempo r \clef treble ds''8(^\conForza cs16 ds  e8 ds16 e |
    fs8 e16 fs  gs8 fs16 gs  a8 a,) |
    \undo \omit TupletNumber
    gs4->~( \tuplet 3/2 4 { gs8-. as-. bs-.  cs-. ds-. e-.) } |
    
    \barNumberCheck 33
    ds2.^\ten |
    \tuplet 3/2 { ds8\( ds ds }  ds cs16( ds  es8) ds16( es |
    fs8) es16( fs  gs8)  fs16( gs  a8) gs16( a |
    \tuplet 3/2 4 { b8) a g  fs\mordent e! fs } \acciaccatura { fs } a, d\) |
    \voiceOne \tuplet 3/2 { cs8( bs e } ds4 cs8) \oneVoice r |
  }
  \key df \major
  \repeat volta 2 {
    \voiceOne f2(^\conAnima \tuplet 3/2 { ef8 df bf) } |
    af2*3/4~( \magnifyMusic #2/3 { \tuplet 6/4 { af32 \beamBreak af bf 
      \beamBreak af g af } } c8. bf16) |
    ef,4. \tuplet 3/2 { ef16( f gf } <gf bf>8. <f af>16) |
    
    \barNumberCheck 41
    <ef gf>4\( \grace { af16_( gf) } f4\) b\rest \voiceThree |
    << 
      { 
        df4*1/2~( \magnifyMusic #2/3 { \tuplet 6/4 { df32 \beamBreak df ef
          \beamBreak df c df~ } } df8 df4 df8 | 
      } 
      \new Voice { s4 \voiceOne gf f | }
    >>
    \subdivideEighths \tuplet 6/4 { d16 ef f  ef d ef } \subdivideOff bf'4.
      af8 |
    df8)\noBeam f->~[( f16 e ef d]  f ef d df) |
    c8( \tuplet 3/2 { c16 df c } bf8 \tuplet 3/2 { bf16 c bf^\riten } af8 
      \tuplet 3/2 { gf16 af gf) } |
    f2( d32[ ef f ef]  \tuplet 3/2 16 { gf \moveTextB _\dolcissimo f \beamBreak
      ef  df c bf } |
    af4) a2->( |
    d4 cs df |
    
    \barNumberCheck 49
    df8 c16 df  ef4 f4*1/2 \hideNoteHead df8) |
    gf8( df16 ef  f8 c  f c16 d | 
    ef8 bf  ef bf16 c  \tuplet 3/2 { df\mordent\arpeggio c df } \beamPositionsA
      f)[\arpeggio b,32\rest\fermata ef]( |
    af,4)~( af16. bf32 af16. bff32  af16. bf32 af16. bff32 |
    af16)[ b32\rest a( bf16 c]  ef4*1/2 af, df8) b\rest |
  }
  df4-\slurShapeK (^\conMoltoEspressione c df |
  f4 ef df) |
  df4-\slurShapeM ( c df |
  
  \barNumberCheck 57
  f4 ef df8. c16) |
  c4-\slurShapeN ( b c |
  ef4 d c) |
  c4( b c |
  d4.) d8->-\slurShapeB \(-\slurShapeC ( c-.) bf-. |
  ef4\)-\slurShapeD ( d c |
  c2-> bf4) |
  ef4-\slurShapeO ( a, bf |
  
  \barNumberCheck 65
  cf2-> bf4) |
  bf2.->~-\slurShapeI ( |
  bf4 bf8-.\mordent a-. bf-. b-.) |
  c4( df^\riten <b d> |
  <c ef>4. <b d>8-. <c ef>-. <c e>-.) |
  % like 38 (16 bars)
  \voiceOne f2(^\aTempo \tuplet 3/2 { ef8 df bf) } |
  af2*3/4~( \magnifyMusic #2/3 { \tuplet 6/4 { af32 \beamBreak af bf \beamBreak
    af g af } } c8. bf16) |
  ef,4. \tuplet 3/2 { ef16( f gf } <gf bf>8. <f af>16) |
  
  \barNumberCheck 73
  <ef gf>4\( \grace { af16_( gf) } f4\) b\rest \voiceThree |
  << 
    { 
      df4*1/2~( \magnifyMusic #2/3 { \tuplet 6/4 { df32 \beamBreak df ef
        \beamBreak df c df~ } } df8 df4 df8 | 
    } 
    \new Voice { s4 \voiceOne gf f | }
  >>
  \subdivideEighths \tuplet 6/4 { d16 ef f  ef d ef } \subdivideOff bf'4. af8 |
  df8)\noBeam f->~[( f16 e ef d]  f ef d df) |
  c8( \tuplet 3/2 { c16 df c } bf8 \tuplet 3/2 { bf16 c bf^\riten } af8 
    \tuplet 3/2 { gf16 af gf) } |
  f2( d32[ ef f ef]  \tuplet 3/2 16 { gf\moveTextB _\dolcissimo f \beamBreak
    ef  df c bf } af4) a2->( |
  d4 cs df |
  
  \barNumberCheck 81
  df8 c16 df  ef4 f4*1/2 \hideNoteHead df8) |
  gf8( df16 ef  f8 c  f c16 d | 
  ef8 bf  ef bf16 c  \tuplet 3/2 { df\mordent\arpeggio c df } \beamPositionsA 
    f)[\arpeggio b,32\rest\fermata ef]( |
  af,4)~( af16. bf32 af16. bff32  af16. bf32 af16. bff32 |
  af16)[ b32\rest a( bf16 c]  ef4*1/2 af, df8) b\rest |
  \bar "|."
}

rightHandLower = \relative {
  \repeat volta 2 {
    \voiceFour 
    s2. * 8 |
    
    \barNumberCheck 9
    s2. * 3 |
    \tupletOff
    \tuplet 3/2 { s8 bs'4~ } bs cs8 s |
  }
  \repeat volta 2 {
    s2. * 4 |
    
    \barNumberCheck 17
    s2. * 3 |
    r8 <cs, fss>16 q  q8-. q-.( <cs fss bs>-. <cs fss as>-. |
    <bs gs'>8) s8 s2 |
    s2. * 3 |
    
    \barNumberCheck 25
    s2. * 8 |
    
    \barNumberCheck 33
    s2. * 4 |
    \tuplet 3/2 { s8 bs'4~ } bs cs8 s |
  }
  \key df\major
  \repeat volta 2 {
    r8 f,-.( f-. f-. gf-. gf-.) |
    f8 f f f ff ff |
    df8 df df df c c |
    
    \barNumberCheck 41
    c8 c df df df df |
    gf8 gf gf gf af af |
    bf8 bf c <af c> <af df> q |
    <df g>8\noBeam g g g g g |
    \tupletOn
    \rotateTupletA \tuplet 3/2 { r16 c, gf'!~ } gf8~ \omit TupletBracket 
      \tuplet 3/2 { gf16 c, gf'~ } gf8 \tuplet 3/2 { f16 c f } 
      \omit TupletNumber \tuplet 3/2 { ef f ef } |
    r8 f, f f gf gf |
    f8 f e e <d fs> q |
    <d g>8 q <e g> q <f af!> <ff bf!> |
    
    \barNumberCheck 49
    <ef bff'>8 q <bff' c> <af c> <af df> q |
    bf8 bf a a af af |
    g8[ g gf gf f\arpeggio <ef bf'>16]\arpeggio s |
    r8 <ef gf!> q q q q |
    <c gf'>8 r r gf'[( f]) s |
  }
  r8 <gf a> q q a a |
  <gf a>8 q q q q q |
  \override DynamicTextSpanner.style = #'none
  <gf a>8 q^\cresc q q^\< a a |
  
  \barNumberCheck 57
  <gf a>8 q q q^\> q \after 16 \! q |
  <f af!>8 q q q af af |
  <f af> q q q q q |
  q8 q q q af af |
  <f af>8 q q q <ef af> <d af'> |
  <ef g>8 q q q q q |
  <d af'>8 q q q q q |
  <ef g>8 q q q q q |
  
  \barNumberCheck 65
  <d af'>8 q q q af' af |
  r8 df,! <df g> q q q |
  q8 q q q q q |
  <ef gf!>8 q q q q q |
  q8 q q q q <e gf> |
  % like 38 (16 bars)
  <f df'!>8 f f f gf gf |
  f8 f f f ff ff |
  df8 df df df c c |
  
  \barNumberCheck 73
  c8 c df df df df |
  gf8 gf gf gf af af |
  bf8 bf c <af c> <af df> q |
  <df g>8\noBeam g g g g g |
  \tupletOn
  \rotateTupletA \tuplet 3/2 { r16 c, gf'!~ } gf8~ \omit TupletBracket 
    \tuplet 3/2 { gf16 c, gf'~ } gf8 \tuplet 3/2 { f16 c f } \omit TupletNumber
    \tuplet 3/2 { ef f ef } |
  r8 f, f f gf gf |
  f8 f e e <d fs> q |
  <d g>8 q <e g> q <f af> <ff bf!> |
  
  \barNumberCheck 81
  <ef bff'>8 q <bff' c> <af c> <af df> q |
  bf8 bf a a af af |
  g8[ g gf gf f\arpeggio <ef bf'>16]\arpeggio s |
  r8 <ef gf!> q q q q |
  <c gf'>8 r r gf'[( f]) s |
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
    s2. * 4 |
    s2 r8 <gs b cs es> |
    r8 <a cs fs> r <b cs gs'> r <a cs fs> |
    gs,8 ds'4.*1/3->( bs'4*1/2 gs  s8 fss) |
    s2. |
    
    \barNumberCheck 9
    s8 gs4*1/2( bs gs  <b es>8[ cs]) |
    fs8( cs)  gs'[( cs,])  a'(\arpeggio cs,) |
    a8( cs d e!  fs4) |
    \omit TupletBracket
    \tuplet 3/2 { e8( ds gs } fs4 e8) s |
  }
  \repeat volta 2 {
    s2. * 4 |
    
    \barNumberCheck 17
    s2. * 5 |
    s8 r <ds a'>4-\slurShapeJ ( <e a> |
    <fs a>2 <e a>4 |
    <ds a'>2 <e a>4 |
    
    \barNumberCheck 25
    <fs a>2 <e a>4 |
    <ds a'>2 <e a>4 |
    <fs a>2 <e a>4 |
    a2.) |
    a2->( gs4)~ |
    gs8 gs bs,[ <fs' gs>] cs <e gs> |
    a,8 <cs fs> gs[ <cs e>] fs, <cs' ds> |
    gs,8 ds'4.*1/3->( bs'4*1/2 gs  s8 fss) |
    
    \barNumberCheck 33
    s2. |
    s8 gs4*1/2( bs gs  <b es>8[ cs]) |
    fs8( cs)  gs'[( cs,])  a'(\arpeggio cs,) |
    a8( cs d e!  fs4) |
    \tuplet 3/2 { e8( ds! gs } fs4 e8) s |
  }
  \key df \major
  \repeat volta 2 {
    s2. * 2 |
    af,8 af af af af af |
    
    \barNumberCheck 41
    af8 af af af cf cf |
    s2. * 7 |
    
    \barNumberCheck 49
    s2. * 5 |
  }
  s2. * 3 |
  
  \barNumberCheck 57
  s2. * 8 |
  
  \barNumberCheck 65
  s2. * 7 |
  af8 af af af af af |
  
  \barNumberCheck 73
  af8 af af af cf cf |
}

leftHandLower = \relative {
  \repeat volta 2 {
    <cs, cs'>32( e8..) <b b'>32( e8..) <a, a'>32( e'8..) |
    <gs, gs'>32( e'8..) <fss, fss'>32( e'8..) r4 |
    <fss' as cs e fss>8.\arpeggio <fss, fss'>16 \once \stemDown <gs gs'>4-.
      <gs, gs'>-. |
    <cs cs'>4-. <cs' gs' e'>-.\arpeggio r |
    <cs,, cs'>8\noBeam <gs''' bs fs'>16 q q8 q \voiceTwo cs,4 |
    fs4 es fs |
    s8 ds bs' gs  <e cs'>[ fss] |
    \oneVoice gs,8( ds' bs' gs gs'->) r |
    
    \barNumberCheck 9
    <gs,,, gs'>8\arpeggio\noBeam \voiceTwo gs''8 fs' gs,  cs,4 |
    <fs a>4 <es b'> <fs a>\arpeggio |
    fs2. |
    gs4. gs8[( cs]) \oneVoice r |
  }
  \repeat volta 2 {
    gs,,8-. <gs' ds'>4( q8 q q) |
    <gs e'>-^ gs,-. r <gs' e'>4( <gs ds'>8) |
    gs,8-. <gs' ds'>4( q8 q q) |
    <gs e'>-^ gs,-. r <gs' fs'>4( <gs e'>8) |
    
    \barNumberCheck 17
    gs,8-. <gs' e'>4( q8 q q) |
    <gs e' fss>-^ gs,-. r <gs' e'>4( <gs ds'>8) |
    <gs e' fss>-^ gs,-. r <gs' e'>4( <gs ds'>8) |
    <ds, ds'>-.\noBeam <ds'' as'>16 q  q8-. q-.( q-. q-. |
    <gs, ds'>-.) r8 r4 r |
    b,!8-. \voiceTwo b''4 b b8~ |
    b8 b b b~ b b~ |
    b8 b b b~ b b~ |
    
    \barNumberCheck 25
    b8 b b b~ b b~ |
    b8 b b b~ b b~ |
    b8 b b b~ b b |
    ds8( fs ds fs ds fs) |
    ds8( fs ds fs ds fs) |
    e4( bs cs |
    a4 gs fs4*1/2 \hideNoteHead cs') |
    s8 ds, bs' gs  <e cs'>[ fss] |
    
    \barNumberCheck 33
    \oneVoice gs,8( ds' bs' gs gs'->) r |
    <gs,,, gs'>8\arpeggio\noBeam \voiceTwo gs''8 fs' gs,  cs,4 |
    <fs a>4 <es b'> <fs a>\arpeggio |
    fs2. |
    gs4. gs8[( cs]) \oneVoice r |
  }
  \key df \major
  \repeat volta 2 {
    \oneVoice df,,8\noBeam <df' af'>-.( q-. <df a'>-. <df bf'>-. <df c'>-.) |
    <df df'>8 q q q <g df'> q |
    \voiceTwo af2 af,4 |
    
    \barNumberCheck 41
    af4( df) r |
    \oneVoice <bf' df>8 q <bff df> q <af df> q |
    <g df'! ef>8 q <gf af ef'> q <f af df> <ff af df> |
    <ef, ef'>8\noBeam \clef treble <ef'' bf' df> q q q q |
    \clef bass af,,,8-. <af'' ef' gf> af,-.[ <af' ef' gf>] af,,-. 
      <af'' af'>-^ |
    df,,,8-.\noBeam <df'' af'> q <df a'> <df bf'> <df c'>_~ |
    <df df'>8 df' cs cs c c |
    b8 b bf a af g |
    
    \barNumberCheck 49
    gf!8 gf gf' gf f f |
    <ef gf>8 q <f, f'> <f ef'> <bf d> <bf f'> |
    <ef, ef'>8 <ef df'!> <af c> <af ef'>_~ <df, af' df> <g df'>16 r\fermata |
    af,8-.\noBeam <af' df> q q q q |
    af,,8-.\noBeam <af'' ef'> r <af c>[( <df, df'>]) r |
  }
  ef'4~-\slurShapeL ( \tuplet 5/4 { ef16 f ef d ef } gf8. df16 |
  df8. c16 ef4) r |
  \stemDown \rotateHairpinB ef,,16(_\< ef' gf af  a gf ef ef'  gf8. df16\! |
  
  \barNumberCheck 57
  df8._\> c16 ef8)\! r r4 |
  r4 r8 d16( ef  g f d c |
  c8. b16 d4) r |
  d,,16( d' f g  bf! af f d  f'8. c16 |
  c8. cf16 bf4) r |
  bf,,16-\slurShapeE ( bf' ef f  g f ef bf  bf'4-.) |
  bf,,16-\slurShapeF ( bf' f' g  af g f bf,  bf'4-.) |
  bf,,16-\slurShapeG ( bf' ef f  g f ef c'  bf4-.) |
  
  \barNumberCheck 65
  \rotateHairpinC bf,,16-\slurShapeH (_\< bf' f' fs  g gs a bf  c d ef f! |
  \after 16 \!  g4)-\moveTextA _\crescBenLegato ff4.->( ef8 |
  ff8. ef16 ff4. ef8 |
  bff4) \stemNeutral <bff,, bff'>4.->( <af af'>8 |
  <bff bff'>8. <af af'>16 <bff bff'>4. <af af'>8) |
  % like 38 (16 bars)
  \oneVoice <df, df'>8\noBeam <df'' af'> q <df a'> <df bf'> <df c'> |
  <df df'>8 q q q <g df'> q |
  \voiceTwo af2 af,4 |
  
  \barNumberCheck 73
  af4( df) r |
  \oneVoice <bf' df>8 q <bff df> q <af df> q |
  <g df'! ef>8 q <gf af ef'> q <f af df> <ff af df> |
  <ef, ef'>8\noBeam \clef treble <ef'' bf' df> q q q q |
  \clef bass af,,,8-. <af'' ef' gf> af,-.[ <af' ef' gf>] af,,-. <af'' af'>-^ |
  df,,,8-.\noBeam <df'' af'> q <df a'> <df bf'> <df c'>_~ |
  <df df'>8 df' cs cs c c |
  b8 b bf a af g |
  
  \barNumberCheck 81
  gf!8 gf gf' gf f f |
  <ef gf>8 q <f, f'> <f ef'> <bf d> <bf f'> |
  <ef, ef'>8[ <ef df'!> <af c> <af ef'>_~ <df, af' df> <g df'>16] r\fermata |
  af,8-.\noBeam <af' df> q q q q |
  af,,8-.\noBeam <af'' ef'> r <af c>[( <df, df'>]) r |
}

leftHand = {
  \global
  \clef bass
  \mergeDifferentlyDottedOn
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \override TextScript.Y-offset = -0.5
  \repeat volta 2 {
    s8-\tweak X-offset -2 \ff\< s\! s\< s\! s\< s\! |
    s8\< s\! s\< s\! s4 |
    s2.\ffz |
    s2 s8 s\f |
    s2.\<
    s2 s8 s\! |
    s2. * 2 |
    
    \barNumberCheck 9
    s2.\p |
    s8 s\dim s4..\> s16\! |
    s2\pp\< s8 s\! |
    s4 s-\tweak Y-offset 1 \> s\! |
  }
  \repeat volta 2 {
    s2. |
    s8 s4\cresc s4\> s8\! |
    s4.\mp s4\< s8\! | 
    s16 s8.\cresc s8 s4\> s8\! |
    
    \barNumberCheck 17
    s4.\fp s4\< s8\! |
    s16\sf s^\semprePiuF s4 s\> s8\! |
    s4.\sf s4\> s8\! |
    s4.\ff s4\> s8\! |
    s2\sf\> s8 s\! |
    s4\p s4..-\tweak Y-offset 4 \< s16\! |
    s2-\tweak Y-offset 4 \> s8. s16\! |
    s4 s4..\< s16\! |
    
    \barNumberCheck 25
    s4 s4.\> s16. s32\! |
    s4 s2^\piuP |
    s4 s4..\> s16\! |
    s2\pp s4\< |
    s2 s8 s\! |
    s4\fz s2\< |
    s2 s8 s\! |
    s2. |
    
    \barNumberCheck 33
    s2. |
    s2.\p |
    s4 s8\dim s4\> s16 s\! |
    s2.\pp\< |
    s8\! s s4\> s8\! s |
  }
  % df major
  \repeat volta 2 {
    s4^\dolce s\< s8\> s\! |
    s2.^\sempreTenuto |
    s2. |
    
    \barNumberCheck 41
    s2. |
    s2.\< |
    s2 s8 s\! |
    s2.\f |
    s2\> s8.. s32\! |
    s8 s4.\< s16 s8\> s32 s\! |
    s2. |
    s4 s2\< |
    
    \barNumberCheck 49
    s8\! s\pocoCresc s2\! |
    \revert DynamicTextSpanner.style
    s4 s4..\dim s16\! |
    s2\> s8 s16\! s |
    s2\p\< s8.. s32\! |
    s4 s\> s\! |
  }
  s2. * 3 |
  
  \barNumberCheck 57
  s2. |
  s2.\p |
  s2. |
  s8 s\< s4.. s16\! |
  \override DynamicTextSpanner.style = #'none
  s8. s16\dim s8 s\> s8. s16\! |
  s8.^\dolce s16\< s8. s16\! s4 |
  s8. s16\< s8. s16\! s4 |
  s8. s16\< s8. s16\! s4 |
  
  \barNumberCheck 65   
  s2. |
  s4. s\< |
  s2 s8 s\! |
  \revert DynamicTextSpanner.style
  s2\cresc s8 s\! |
  s8 s8\< s4. s8\! |
  s2\fp\< s8\> s\! |
  s2.^\dolce |
  s2. |
  
  \barNumberCheck 73
  s2. |
  s2.\< |
  s2 s8 s\! |
  s2.\f |
  \override DynamicTextSpanner.style = #'none
  s8\dim s8\> s4... s32\! |
  s8 s4.\< s16\! s16\> s16. s32\! |
  s2. |
  s4 s2\< |
  
  \barNumberCheck 81
  \revert DynamicTextSpanner.style
  s8\! s\pocoCresc s2 |
  s4 s4..\dim s16\! |
  s2\> s8 s16\! s |
  s2\p\< s8.. s32\! |
  s4 s\> s\! |
}

tempi = {
  \set Score.tempoHideNote = ##t
  \repeat volta 2 {
    \tempo "Allegro appassionato." 4 = 92
    s2. * 8 |
    
    \barNumberCheck 9
    s2. * 4 |
  }
  \repeat volta 2 {
    s2. * 4 |
    
    \barNumberCheck 17
    s2. * 8 |
    
    \barNumberCheck 25
    s2. |
    \tempo 4 = 88
    s2. * 2 |
    \tempo 4 = 80
    s2. |
    \tempo 4 = 76
    s2. |
    \tempo 4 = 92
    s2. * 3 | 
    
    \barNumberCheck 33
    s2. * 5 |
  }
  % df major
  \repeat volta 2 {
    \tempo "Meno mosso." 4 = 80
    s2. * 3 |
    
    \barNumberCheck 41
    s2. * 4 |
    s4. \tempo 4 = 69 s |
    \tempo 4 = 80
    s2. * 3 |
    
    \barNumberCheck 49
    s2. * 2 |
    s2 s8 \tempo 4 = 20 s16. \tempo 4 = 80 s32 |
    s2. * 2 |
  }
  s2. * 3 |
  
  \barNumberCheck 57
  s2. * 8 |
  
  \barNumberCheck 65
  s2. * 3
  s4 \tempo 4 = 72 s2 |
  s2. |
  \tempo 4 = 80
  s2. * 3 |
  
  \barNumberCheck 73
  s2. * 4 |
  s4. \tempo 4 = 69 s |
  \tempo 4 = 80
  s2. * 3 |
  
  \barNumberCheck 81
  s2. * 2 |
  s2 s8 \tempo 4 = 20 s16. \tempo 4 = 80 s32 |
  s2. * 2 |
}

pedal = {
  \repeat volta 2 {
    s2. * 2 |
    s8.\sd s16\su s2 |
    s4.\sd s\su |
    s4.-\tweak Y-offset -3 \sd s8\su s\sd s\su |
    s2. |
    s4.\sd s8\su s4 |
    s2\sd s4\su |
    
    \barNumberCheck 9
    s4.-\tweak Y-offset -2 \sd s8\su s\sd s\su |
    s2. * 3 |
  }
  \repeat volta 2 {
    s2-\tweak Y-offset -1 \sd s8 s\su |
    s2\sd s4\su |
    s2-\tweak Y-offset -1 \sd s8 s\su |
    s2\sd s4\su |
    
    \barNumberCheck 17
    s2-\tweak Y-offset -2 \sd s8 s\su |
    s2\sd s4\su |
    s2\sd s4\su |
    s2-\tweak Y-offset -2 \sd s4\su |
    s2. |
    s2\sd s4\su |
    s2. * 2 |
    
    \barNumberCheck 25
    s2. * 7 |
    s4.\sd s\su |
    
    \barNumberCheck 33
    s2\sd s8 s\su |
    s4.-\tweak Y-offset -1 \sd s8\su s\sd s\su |
    s2. * 3 |
  }
  % df major
  \repeat volta 2 {
    s4.\sd s\su |
    s2. * 2 |
    
    \barNumberCheck 41
    s4 s\sd s\su |
    s2. * 2 |
    s2\sd s8. s16\su |
    s8.\sd s16\su s8.\sd s16\su s8.\sd s16\su |
    s4.-\tweak Y-offset -2 \sd s\su |
    s2. * 2 |
    
    \barNumberCheck 49
    s2. * 3 |
    s4\sd s16 s8.\su s4 |
    s8-\tweak Y-offset -2 \sd s\su s2 |
  }
  s2. * 2 |
  s8.\sd s16\su s2 |
  
  \barNumberCheck 57
  s2. * 3 |
  s8.\sd s16\su s2 |
  s2. |
  s8.\sd s16\su s2 |
  s8.\sd s16\su s2 |
  s8.\sd s16\su s2 |
  
  \barNumberCheck 65
  s2. * 5 |
  % like 38 (16 bars)
  s4.-\tweak Y-offset -2 \sd s\su |
  s2. * 2 |
  
  \barNumberCheck 73
  s4 s\sd s\su |
  s2. * 2 |
  s2\sd s8. s16\su |
  s8.\sd s16\su s8.\sd s16\su s8.\sd s16\su |
  s4.-\tweak Y-offset -2 \sd s\su |
  s2. * 2 |
  
  \barNumberCheck 81
  s2. * 3 |
  s4\sd s16 s8.\su s4 |
  s8-\tweak Y-offset -2 \sd s\su s2 |
}

forceBreaks = {
  % page 1
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 2
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 3
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\pageBreak
  
  % page 4
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\pageBreak
  
  % page 5
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 2 { s2.\noBreak } s2.\break\noPageBreak
  \repeat unfold 3 { s2.\noBreak } s2.\break\noPageBreak
}

polonaiseOneNotes =
\score {
  \header {
    title = "Polonaise One"
    composer = "Frédéric Chopin"
    opus = "Opus 26, No. 1"
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

polonaiseOneMidi =
\book {
  \bookOutputName "polonaise-op26-no1"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
