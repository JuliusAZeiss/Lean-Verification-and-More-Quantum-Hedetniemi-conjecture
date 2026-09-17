import Hedetniemi.Round4.SmallGraphs
import Hedetniemi.Round4.SupportRows.All

namespace Hedetniemi.Round4
open scoped BigOperators
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option exponentiation.threshold 100000

/-- Support check on the 197 cosets and four possible internal shifts. -/
theorem kernel_support : ∀ (s : Fin 4) (i j : Fin 197),
    kernelEntryN s.val i.val j.val = 0 ∨ (i = j ∧ s = 0) ∨
      ∃ a : Fin 22, 4 * ((cosetCoordinate i).val ^^^ (cosetCoordinate j).val) + s.val = step a := by
  intro s i j
  exact kernel_support_all s i j

theorem xor_base_four (a b h k : ℕ) (hh : h < 4) (hk : k < 4) :
    (4*a+h) ^^^ (4*b+k) = 4*(a ^^^ b)+(h ^^^ k) := by
  have hd := Nat.xor_div_two_pow (a := 4*a+h) (b := 4*b+k) (n := 2)
  have hm := Nat.xor_mod_two_pow (a := 4*a+h) (b := 4*b+k) (n := 2)
  norm_num only [Nat.pow_succ, Nat.pow_zero, Nat.mul_one] at hd hm
  have ha : (4*a+h)/4=a := by omega
  have hb : (4*b+k)/4=b := by omega
  have hma : (4*a+h)%4=h := by omega
  have hmb : (4*b+k)%4=k := by omega
  rw [ha,hb] at hd
  rw [hma,hmb] at hm
  omega

theorem sourceMatrixInt_support (u v : Fin 788) (hne : u ≠ v)
    (hnot : ¬ baseGraph.Adj u v) : sourceMatrixInt u v = 0 := by
  let i : Fin 197 := ⟨u.val/4,by omega⟩
  let j : Fin 197 := ⟨v.val/4,by omega⟩
  let s : Fin 4 := ⟨(u.val%4) ^^^ (v.val%4),
    Nat.xor_lt_two_pow (n := 2) (by omega) (by omega)⟩
  rcases kernel_support s i j with hz | ⟨hij,hs⟩ | ⟨a,ha⟩
  · exact hz
  · have hij' : u.val/4=v.val/4 := congrArg Fin.val hij
    have hs' : u.val%4 ^^^ v.val%4=0 := congrArg Fin.val hs
    have hmod : u.val%4=v.val%4 := Nat.xor_eq_zero.mp hs'
    exact False.elim (hne (Fin.ext (by omega)))
  · exfalso
    apply hnot
    refine ⟨a,?_⟩
    change (4*(cosetCoordinate i).val+u.val%4) ^^^
      (4*(cosetCoordinate j).val+v.val%4) = step a
    rw [xor_base_four _ _ _ _ (by omega) (by omega)]
    exact ha

def sourceMatrix : Matrix (Fin 788) (Fin 788) ℝ :=
  fun u v => (sourceMatrixInt u v : ℝ)

/-- Integer diagonal weights of the simplified exact round-four certificate. -/
def coordinateWeight (n : ℕ) : ℤ :=
  if n = 996 then 60 else if n = 992 then 69 else
  if n ∈ ([26,185,785,868,932,964,1012,1019] : List ℕ) then 72 else
  if n ∈ ([193,291,349,587,663,1004] : List ℕ) then 73 else
  if n ∈ ([351,994,998,1006] : List ℕ) then 75 else 74

def integerWeight (v : Fin 788) : ℤ := coordinateWeight (baseCoordinate v).val

def weightedMatrix : Matrix (Fin 788) (Fin 788) ℝ := fun u v =>
  (integerWeight u : ℝ) * (integerWeight v : ℝ) * sourceMatrix u v

theorem weightedMatrix_support (u v : Fin 788) (hne : u ≠ v)
    (hnot : ¬ baseGraph.Adj u v) : weightedMatrix u v = 0 := by
  simp only [weightedMatrix,sourceMatrix,sourceMatrixInt_support u v hne hnot,Int.cast_zero,mul_zero]

end Hedetniemi.Round4
