import Hedetniemi.Round4.SupportedPSD
import Hedetniemi.LocalColoring

namespace Hedetniemi.Round4

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- The sorted cosets retained by the final exact 788-vertex certificate. -/
def cosetData : Array (Fin 256) := #[4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25, 26, 27, 31, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 164, 165, 166, 167, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 204, 205, 206, 207, 208, 209, 210, 211, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 248, 249, 250, 251, 252, 253, 254, 255]

theorem cosetData_size : cosetData.size = 197 := by decide

def cosetNat (i : ℕ) : ℕ :=
  if i < 4 then i + 4 else if i < 8 then i + 8 else if i < 16 then i + 12 else if i < 17 then i + 15 else if i < 73 then i + 19 else if i < 93 then i + 27 else if i < 105 then i + 31 else if i < 125 then i + 35 else if i < 129 then i + 39 else if i < 141 then i + 43 else if i < 153 then i + 47 else if i < 161 then i + 51 else if i < 189 then i + 55 else i + 59

theorem cosetNat_lt : ∀ i : Fin 197, cosetNat i.val < 256 := by decide

def cosetCoordinate (i : Fin 197) : Fin 256 :=
  ⟨cosetNat i.val, cosetNat_lt i⟩

theorem cosetCoordinate_eq_data : ∀ i : Fin 197,
    cosetCoordinate i = cosetData[i.val]'(by simpa only [cosetData_size] using i.isLt) := by decide

def baseCoordinate (v : Fin 788) : Fin 1024 :=
  ⟨4 * (cosetCoordinate ⟨v.val / 4, by omega⟩).val + v.val % 4, by
    have h := (cosetCoordinate ⟨v.val / 4, by omega⟩).isLt
    omega⟩

def blockIndex (i : Fin 197) (h : Fin 4) : Fin 788 :=
  ⟨4 * i.val + h.val, by omega⟩

theorem baseCoordinate_blockIndex (i : Fin 197) (h : Fin 4) :
    (baseCoordinate (blockIndex i h)).val = 4 * (cosetCoordinate i).val + h.val := by
  have hd : (4 * i.val + h.val) / 4 = i.val := by omega
  have hm : (4 * i.val + h.val) % 4 = h.val := by omega
  simp only [baseCoordinate, blockIndex, hd, hm]

theorem cosetCoordinate_strictMono : StrictMono cosetCoordinate := by
  apply Fin.strictMono_iff_lt_succ.mpr
  decide

theorem cosetCoordinate_injective : Function.Injective cosetCoordinate :=
  cosetCoordinate_strictMono.injective

theorem baseCoordinate_injective : Function.Injective baseCoordinate := by
  intro u v huv
  have heq := congrArg Fin.val huv
  change 4 * (cosetCoordinate ⟨u.val / 4, by omega⟩).val + u.val % 4 =
    4 * (cosetCoordinate ⟨v.val / 4, by omega⟩).val + v.val % 4 at heq
  have hc : cosetCoordinate ⟨u.val / 4, by omega⟩ =
      cosetCoordinate ⟨v.val / 4, by omega⟩ := Fin.ext (by omega)
  have hdiv : u.val / 4 = v.val / 4 := congrArg Fin.val (cosetCoordinate_injective hc)
  have hcoset := congrArg Fin.val hc
  exact Fin.ext (by omega)

/-- The 22 fixed Cayley generators, in the exported coordinate basis. -/
def stepData : Array ℕ := #[1, 2, 4, 32, 64, 128, 256, 512, 8, 915, 457, 16, 711, 431, 245, 805, 619, 861, 1022, 697, 31, 371]

theorem stepData_size : stepData.size = 22 := by decide

def step (i : Fin 22) : ℕ :=
  stepData[i.val]'(by simpa only [stepData_size] using i.isLt)

theorem step_ne_zero : ∀ i : Fin 22, step i ≠ 0 := by decide

/-- An explicit Boolean separator for two-generator and three-generator XORs.
Its use below is certified by kernel reduction, rather than an external computation. -/
def evenMask : ℕ := 104105376194350936858792382220532698044525858220633574555348274647396958063913524224237014189798731722412233010316657952463528895275933875974979263676270124773937970802409107351730725484518979812083706219432550065885840400281760127822436989460755819292234863126682722933365569774233973119384405205482311423593

def isEvenCode (v : ℕ) : Bool := evenMask.testBit v

theorem two_steps_even : ∀ i j : Fin 22,
    isEvenCode (step i ^^^ step j) = true := by decide

theorem three_steps_odd : ∀ i j k : Fin 22,
    isEvenCode ((step i ^^^ step j) ^^^ step k) = false := by decide

/-- The actual induced graph of the explicit coordinate set. -/
def baseGraph : SimpleGraph (Fin 788) where
  Adj u v := ∃ i : Fin 22, (baseCoordinate u).val ^^^ (baseCoordinate v).val = step i
  symm := by intro u v h; simpa only [Nat.xor_comm] using h
  loopless := by
    intro u h
    obtain ⟨i,hi⟩ := h
    exact step_ne_zero i (by simpa using hi.symm)

instance : DecidableRel baseGraph.Adj := fun u v => inferInstanceAs
  (Decidable (∃ i : Fin 22, (baseCoordinate u).val ^^^ (baseCoordinate v).val = step i))

private theorem xor_path (a b c : ℕ) : (a ^^^ b) ^^^ (b ^^^ c) = a ^^^ c := by
  rw [Nat.xor_assoc, ← Nat.xor_assoc b b c, Nat.xor_self, Nat.zero_xor]

theorem baseGraph_noClosedWalkFive : NoClosedWalkFive baseGraph := by
  intro a b c d e hab hbc hcd hde hea
  obtain ⟨i,hi⟩ := hab
  obtain ⟨j,hj⟩ := hbc
  obtain ⟨k,hk⟩ := hcd
  obtain ⟨l,hl⟩ := hde
  obtain ⟨m,hm⟩ := hea
  have heq : (step i ^^^ step j) ^^^ step k = step l ^^^ step m := by
    rw [← hi, ← hj, ← hk, ← hl, ← hm, xor_path, xor_path, xor_path,
      Nat.xor_comm (baseCoordinate a).val (baseCoordinate d).val]
  have hodd := three_steps_odd i j k
  rw [heq, two_steps_even] at hodd
  contradiction

theorem baseGraph_noTriangles : NoTriangles baseGraph := by
  intro a b c hab hbc hca
  exact baseGraph_noClosedWalkFive a b c a b hab hbc hca hab (baseGraph.symm hab)

/-- The only shorter fiber is at exported coordinate 996. -/
def fiberSize (v : Fin 788) : ℕ := if baseCoordinate v = 996 then 239 else 394

theorem fiberSize_pos (v : Fin 788) : 0 < fiberSize v := by
  unfold fiberSize
  split <;> omega

theorem fiberSize_le (v : Fin 788) : fiberSize v ≤ 394 := by
  unfold fiberSize
  split <;> omega

theorem baseCoordinate_eq_996_iff : ∀ v : Fin 788,
    baseCoordinate v = 996 ↔ v = 760 := by decide

def smallG : SimpleGraph (Σ v : Fin 788, Fin (fiberSize v)) :=
  variableCliqueBlowup baseGraph fiberSize

theorem smallG_card : Fintype.card (Σ v : Fin 788, Fin (fiberSize v)) = 310317 := by
  rw [Fintype.card_sigma]
  simp only [Fintype.card_fin]
  simp_rw [fiberSize, baseCoordinate_eq_996_iff]
  rw [Finset.sum_ite]
  simp [Finset.filter_eq', Finset.filter_ne', Finset.card_erase_of_mem]

end Hedetniemi.Round4
