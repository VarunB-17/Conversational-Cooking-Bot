bg('<div class="vh-100 vw-100 audioEnabled">~a</div>').
header('<nav class="navbar mb-1"><div class="navbar-brand listening_icon"></div></nav>').
main('<main class="container-fluid text-center">~a</main>').
footer('<footer class="fixed-bottom"><p class="lead mb-0 bg-light text-center speech_text" style="min-height:3rem"></p></footer>').

html(Main, Html) :-
	header(H), main(MT), format(atom(M), MT, [Main]),
	footer(F), atom_concat(H,M,HM), atom_concat(HM,F,SubHtml),
	bg(BG), format(atom(Html),BG,[SubHtml]).

heading('<h1 style="font-size:65pt;margin-top:20vh;">~a</h1>').
heading(Content, Html) :- heading(T), format(atom(Html),T,[Content]).

paragraph('<p class="text-info">~a</p>').
paragraph(Content, Html) :- paragraph(T), format(atom(Html), T, [Content]).

img('<img class="img-fluid" style="max-height:30rem" src="~a">').
img(Src, Html) :- img(I), format(atom(Html), I, [Src]).

button('<button class="btn btn-light btn-lg m-3" style="font-size:1.5rem">~a</button>').
button(Content, Html) :- button(B), format(atom(Html), B, [Content]).

buttons([], Html, Html).
buttons([Curr|Rest], Tmp, Html) :- button(Curr,B), atom_concat(Tmp, B, New), buttons(Rest,New,Html).
buttons(ContentList, Html) :- buttons(ContentList,'',Html).

% Special layout for Pasta Aglio e Olio (example to inspire you to start thinking about layouts).
% See also the Layout section on https://getbootstrap.com/docs/5.1/getting-started/introduction/.
myPastaAglioPage(Txt, Button, Html) :-
	myPastaAglioImgCard(I), myPastaAglioTxtCard(Txt, T), 
	(Button = '' -> B = '' ; button(Button, B)),
	atom_concat(I, T, IT), atom_concat(IT, B, ITB), html(ITB, Html). 
	 
myPastaAglioImgCard('<div class="card mx-auto"><img class ="img-fluid" src="https://images.happycow.net/venues/1024/21/79/hcmp217975_1197912.jpeg" style="max-height:25rem"></div>').
myPastaAglioTxtCard('<div class="w-100 card"><p>~a</p></div>').
myPastaAglioTxtCard(Txt, Html) :- myPastaAglioTxtCard(T), format(atom(Html), T, [Txt]).