% vertex1.mp -- do not edit, generated automatically by thesis.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 40*2.84526pt#, 25*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vleft (__i1, __i2);
vright (__o1);
vconnect ("plain,tension=1/3", __i1, __v2, __v1);
vconnect ("plain,tension=1/3", __i2, __v3, __v1);
vconnect ("gluon,tension=0", __v2, __v3);
vconnect ("gluon", __v1, __o1);
vdot (__v1, __v2, __v3);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
