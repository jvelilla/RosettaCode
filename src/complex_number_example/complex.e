note
	description: "Immutable complex"

class
	COMPLEX

inherit
	NUMERIC

create
	make,
	default_create

feature {NONE} -- Initialization

	make (a_real, a_imag: REAL)
			-- Create a complex with 'a_real' as real part and 'a_imag' as imaginary part.
		do
			real := a_real
			imag := a_imag
		ensure
			real_effect: real = a_real
			imag_effect: imag = a_imag
		end

feature -- Access

	real: REAL
			-- Real part

	imag: REAL
			-- Imaginary part

	one: like Current
			-- Neutral element for "*" and "/"
		do
			create Result.make (1, 0)
		end

	zero: like Current
			-- Neutral element for "+" and "-"
		do
			create Result
		end

feature -- Operations

	plus alias "+" (other: like Current): like Current
			-- Sum with `other' (commutative).
		do
			create Result.make (real + other.real, imag + other.imag)
		end

	minus alias "-" alias "−" (other: like Current): like Current
			-- Result of subtracting `other'
		do
			create Result.make (real - other.real, imag - other.imag)
		end

	product alias "*" alias "×" (other: like Current): like Current
			-- Product by `other'
		do
			create Result.make (real * other.real - imag * other.imag, imag * other.real + real * other.imag)
		end

	quotient alias "/" alias "÷"  (other: like Current): like Current
			-- Division by `other'
		local
			a, b, c, d: REAL
			r, i: REAL
			n: REAL
		do
			a := real
			b := imag
			c := other.real
			d := other.imag
			r := a * c + b * d
			i := b * c - a * d
			n := c * c + d * d
			create Result.make (r / n, i / n)
		end

	identity alias "+": like Current
			-- Unary plus
		do
			Result := Current
		end

	opposite alias "-" alias "−": like Current
			-- Unary minus
		do
			create Result.make (- real, - imag)
		end

	divisible (other: like Current): BOOLEAN
			-- May current object be divided by `other'?
		do
			Result := other /~ zero
		end

	exponentiable (other: COMPLEX): BOOLEAN
			-- May current object be elevated to the power `other'?
		do
			Result := False
		end

end

