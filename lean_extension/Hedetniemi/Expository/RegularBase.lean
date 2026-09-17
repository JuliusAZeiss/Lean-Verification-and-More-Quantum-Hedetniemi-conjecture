import Hedetniemi.Round4.SmallGraphs

namespace Hedetniemi.Expository
open Hedetniemi.Round4
open scoped BigOperators

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- The unpruned 1024-vertex binary Cayley graph with the same 22 generators. -/
def regularBase : SimpleGraph (Fin 1024) where
  Adj u v := ∃ i : Fin 22, u.val ^^^ v.val = step i
  symm := by intro u v h; simpa only [Nat.xor_comm] using h
  loopless := by
    intro u h
    obtain ⟨i,hi⟩ := h
    exact step_ne_zero i (by simpa using hi.symm)

instance : DecidableRel regularBase.Adj := fun u v => inferInstanceAs
  (Decidable (∃ i : Fin 22, u.val ^^^ v.val = step i))

private theorem xor_path (a b c : ℕ) : (a ^^^ b) ^^^ (b ^^^ c) = a ^^^ c := by
  rw [Nat.xor_assoc, ← Nat.xor_assoc b b c, Nat.xor_self, Nat.zero_xor]

theorem regularBase_noClosedWalkFive : NoClosedWalkFive regularBase := by
  intro a b c d e hab hbc hcd hde hea
  obtain ⟨i,hi⟩ := hab
  obtain ⟨j,hj⟩ := hbc
  obtain ⟨k,hk⟩ := hcd
  obtain ⟨l,hl⟩ := hde
  obtain ⟨m,hm⟩ := hea
  have heq : (step i ^^^ step j) ^^^ step k = step l ^^^ step m := by
    rw [← hi, ← hj, ← hk, ← hl, ← hm, xor_path, xor_path, xor_path,
      Nat.xor_comm a.val d.val]
  have hodd := three_steps_odd i j k
  rw [heq, two_steps_even] at hodd
  contradiction

theorem regularBase_noTriangles : NoTriangles regularBase := by
  intro a b c hab hbc hca
  exact regularBase_noClosedWalkFive a b c a b hab hbc hca hab
    (regularBase.symm hab)

def regularXor (u v : Fin 1024) : Fin 1024 :=
  ⟨u.val ^^^ v.val, Nat.xor_lt_two_pow (n := 10) u.isLt v.isLt⟩

theorem regularXor_comm (u v : Fin 1024) :
    regularXor u v = regularXor v u := Fin.ext (Nat.xor_comm _ _)

theorem regularXor_self (u : Fin 1024) : regularXor u u = 0 := by
  apply Fin.ext
  exact Nat.xor_self _

theorem regularXor_assoc (u v w : Fin 1024) :
    regularXor (regularXor u v) w = regularXor u (regularXor v w) :=
  Fin.ext (Nat.xor_assoc _ _ _)

theorem regularXor_zero (u : Fin 1024) : regularXor u 0 = u := by
  apply Fin.ext
  exact Nat.xor_zero _

theorem regularXor_cancel (u v : Fin 1024) :
    regularXor u (regularXor u v) = v := by
  rw [← regularXor_assoc, regularXor_self, regularXor_comm, regularXor_zero]

def regularXorEquiv (u : Fin 1024) : Fin 1024 ≃ Fin 1024 where
  toFun := regularXor u
  invFun := regularXor u
  left_inv := regularXor_cancel u
  right_inv := regularXor_cancel u

def regularStepMask : ℕ :=
  44942328371557897693232629769725895318932564529233719288344066626376124897614671904080234495827541230682159496886881345667926111471364334114160593665036835501806854387756271750803805327089669989708410590379152239759093176606021774632569291878598451472117256040003022715208908674208414550391718724385019855126

def regularStepBool (u : ℕ) : Bool := regularStepMask.testBit u

theorem regularStepBool_iff : ∀ u : Fin 1024,
    regularStepBool u.val = true ↔ ∃ i : Fin 22, u.val = step i := by
  decide +kernel

/-- The integer XOR kernel of A+10I. -/
def regularKernel (u : ℕ) : ℤ :=
  if u = 0 then 10 else if regularStepBool u then 1 else 0

/-- The integer XOR kernel of A²−8A−180I. Its Gram identity is checked below. -/
def regularGramKernel (u : ℕ) : ℤ :=
  if u = 0 then -158 else if regularStepBool u then -8
  else if isEvenCode u then 2 else 0

def regularMatrixInt (u v : Fin 1024) : ℤ := regularKernel (u.val ^^^ v.val)

def regularGramMatrixInt (u v : Fin 1024) : ℤ :=
  regularGramKernel (u.val ^^^ v.val)

noncomputable def regularMatrix : Matrix (Fin 1024) (Fin 1024) ℝ :=
  fun u v => (regularMatrixInt u v : ℝ)

theorem regularMatrixInt_support (u v : Fin 1024)
    (hne : u ≠ v) (hnot : ¬ regularBase.Adj u v) : regularMatrixInt u v = 0 := by
  have hx : u.val ^^^ v.val ≠ 0 := by
    intro h
    exact hne (Fin.ext (Nat.xor_eq_zero.mp h))
  have hs : regularStepBool (u.val ^^^ v.val) ≠ true := by
    intro h
    exact hnot ((regularStepBool_iff (regularXor u v)).mp h)
  simp [regularMatrixInt,regularKernel,hx,hs]

theorem regularMatrix_diagonal (u : Fin 1024) : regularMatrix u u = 10 := by
  simp [regularMatrix,regularMatrixInt,regularKernel]

theorem regularKernel_sum : (∑ v : Fin 1024, regularKernel v.val) = 32 := by
  decide +kernel

theorem regularMatrix_row_sum (u : Fin 1024) :
    (∑ v : Fin 1024, regularMatrix u v) = 32 := by
  have he := (regularXorEquiv u).sum_comp
    (fun v : Fin 1024 => (regularKernel v.val : ℝ))
  have hsum : (∑ v : Fin 1024, (regularKernel v.val : ℝ)) = 32 := by
    exact_mod_cast regularKernel_sum
  simpa only [regularXorEquiv,regularXor,regularMatrix,regularMatrixInt] using
    he.trans hsum

theorem regularMatrix_entry_sum : (∑ u : Fin 1024, ∑ v : Fin 1024,
    regularMatrix u v) = 32768 := by norm_num [regularMatrix_row_sum]

theorem regularMatrix_trace : (∑ u : Fin 1024, regularMatrix u u) = 10240 := by
  norm_num [regularMatrix_diagonal]

end Hedetniemi.Expository
