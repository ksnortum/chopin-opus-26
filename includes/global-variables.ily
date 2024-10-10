\version "2.24.0"

%
% Scheme functions
%

makeSpanner =
#(define-music-function (mrkup) (markup?)
  #{
    \override TextSpanner.bound-details.left.text = #mrkup
    \override TextSpanner.bound-details.left.stencil-align-dir-y = 0.25
    \override TextSpanner.bound-details.left-broken.text = ##f
  #})

beamBreak =
#(define-music-function (music) (ly:music?)
  #{
    \set stemRightBeamCount = #2
    #music 
    \set stemLeftBeamCount = #2
  #})

pocoCrescMarkup = 
  \markup \large \italic \whiteout \pad-markup #0.25 "poco cresc."
pocoCresc =
  #(make-music 'CrescendoEvent 'span-direction START 'span-type 'text
               'span-text pocoCrescMarkup)

puiCrescMarkup =
  \markup \large \italic \whiteout \pad-markup #0.25 "più cresc."
piuCresc =
  #(make-music 'CrescendoEvent 'span-direction START 'span-type 'text
               'span-text puiCrescMarkup)
  
ffz = #(make-dynamic-script "ffz")

ppStaccMarkup = \markup { \dynamic pp \normal-text \larger \italic stacc. }
ppStacc = 
  \tweak self-alignment-X LEFT
  #(make-dynamic-script ppStaccMarkup)
  
beamBreak =
#(define-music-function (music) (ly:music?)
  #{
    \set stemRightBeamCount = #1
    #music 
    \set stemLeftBeamCount = #1
  #})

%
% Redefine
%

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

sd = \sustainOn
su = \sustainOff

hideNoteHead = \once {
  \omit Stem
  \omit Dots
  \omit Flag
  \hideNotes
  \override NoteColumn.ignore-collision = ##t
}

tupletOff = {
  \omit TupletNumber
  \omit TupletBracket
}
tupletOn = {
  \undo \omit TupletNumber
  \undo \omit TupletBracket
}

subdivideEighths = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = 2,2,2,2
}

subdivideOff = {
  \set subdivideBeams = ##f
  \unset baseMoment
  \unset beatStructure
}

trillLower = \tweak outside-staff-priority -100 \etc

upperFermataOverBarLine = {
  \once \override Score.TextMark.self-alignment-X = #CENTER
  \once \override Score.TextMark.outside-staff-priority = -100
  \textEndMark \markup { \musicglyph "scripts.ufermata" }
}
lowerFermataOverBarLine = {
  \tweak direction #DOWN
  \textEndMark \markup { \musicglyph "scripts.dfermata" }
}

%
% Markup
%

dolcissimo = \markup \italic dolcissimo
riten = \markup \large \italic riten.
accel = \markup \large \italic accel.
sotoVoce = \markup \large \italic "soto voce"
ten = \markup \large \italic ten.
dolce = \markup \large \italic dolce
agitato = \markup \large \italic agitato
poco = \markup \large \italic poco
pocoRit = \markup \large \italic "poco rit."
pocoRiten = \markup \large \italic "poco riten."
aTempo = \markup \large \italic "a tempo"
conForza = \markup \large \italic "con forza"
conAnima = \markup \large \italic "con anima"
sempreTenuto = \markup \large \italic "sempre tenuto"
conMoltoEspressione = \markup \large \italic "con molto espressione"
crescBenLegato = \markup \large \italic "cresc. ben legato"
moltoCresc = \markup \large \italic "molto cresc."
calando = \markup \large \italic calando
mancando = \markup \large \italic mancando
semprePiuF = \markup { \large "sempre più" \dynamic f }
piuP = \markup { \large più \dynamic p }
piuF = \markup { \large più \dynamic f }
piuFSpace = \markup { \large più \concat { \dynamic f " " } }
semprePp = \markup { \large sempre \dynamic pp }
crescWO = \markup \large \italic \whiteout \pad-markup #0.25 cresc.
staccatoMarkup = \markup \large \italic staccato
sostenuto = \markup \large \italic sostenuto
sfMarkup = \markup \dynamic sf

ritardSpanner = \makeSpanner \markup \large \italic ritard.
pocoRitenSpanner = \makeSpanner \pocoRiten
ritenSpanner = \makeSpanner \riten
piuFSpanner = \makeSpanner \piuFSpace
crescSpanner = \makeSpanner \crescWO
accelEStretto = \makeSpanner \markup \large \italic "accel. e stretto "
ritenAssai = \makeSpanner \markup \large \italic "riten. assai "
