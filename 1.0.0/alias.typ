// Global Aliases

#let sc = smallcaps

#let cap = math.inter.big
#let cup = math.union.big
#let del = math.partial
#let empty = math.emptyset
#let ex = math.exists
#let fa = math.forall
#let has = math.in.rev
#let iso = math.tilde.equiv
#let mop = math.minus.plus
#let pom = math.plus.minus
#let over = math.slash
#let sub = math.subset.eq
#let super = math.supset.eq
#let wo = math.without

#let bmod(it) = h(0.5em) + $("mod" it)$
#let ind(it) = $bb(1)[it]$
#let inv(it) = math.attach(it, tr: $-1$)
#let large(it) = math.stretch(it, size: 200%)
#let scr(it) = text(features: ("ss01",), box($cal(it)$))
#let transp(it) = math.attach(it, tr: math.top)
#let conjg-transp(it) = math.attach(it, tr: math.dagger)
