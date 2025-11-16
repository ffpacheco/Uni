type Letras = (Char,Char)          -- um bloco de letras
type Digitos = (Int,Int)           -- um bloco de algarismos
type Matricula = (Letras, Digitos, Letras)  -- uma matrícula

valida :: Matricula -> Bool
valida ((l1,l2),(d1,d2),(l3,l4)) =
    validaLetras (l1,l2) && validaDigitos (d1,d2) && validaLetras (l3,l4)

validaLetras :: Letras -> Bool
validaLetras (l1,l2) =
    l1 <= 'Z' && l1 >= 'A' &&
    l2 <= 'Z' && l2 >= 'A'

validaDigitos :: Digitos -> Bool
validaDigitos (d1,d2) =
    d1 <= 9 && d1 >= 0 &&
    d2 <= 9 && d2 >= 0

incrMatricula :: Matricula -> Matricula
incrMatricula (letras1, digitos, letras2) =
    let l2 = incrLetras letras2
    in if l2 /= ('A','A') then
        (letras1, digitos, l2)
    else
        let d2 = incrDigitos digitos
        in if d2 /= (0,0) then
            (letras1, d2, ('A','A'))
        else
            (incrLetras letras1, (0,0), ('A','A'))


incrDigitos :: Digitos -> Digitos
incrDigitos (d1,d2)
    | d2 < 9     = (d1, d2 + 1)
    | d1 < 9     = (d1 + 1, 0)
    | otherwise  = (0, 0)

incrLetras :: Letras -> Letras
incrLetras (l1,l2)
    | l2 < 'Z'   = (l1, chr (ord l2 + 1))
    | l1 < 'Z'   = (chr (ord l1 + 1), 'A')
    | otherwise  = ('A', 'A')
