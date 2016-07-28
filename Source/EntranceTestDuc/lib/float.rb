# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Float
  # np/100 rounded up to the nearest 0.05
  def round_to(x)
    (self * 10**x).round.to_f / 10**x
  end
end
