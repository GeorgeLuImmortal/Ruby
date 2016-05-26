class Privacy
  def runtest
    protected_mth
    private_mth
    public_mth

    self.public_mth
    self.protected_mth
    #self.private_mth     #Error

    obj = Subpravicy.new
    obj.public_mth
    obj.protected_mth
    #obj.private_mth       #Error
  end

  def public_mth
    puts "#{self.class}: This is public; can be invoked!"
  end

  def protected_mth
    puts "#{self.class}: This is protected, be careful!"
  end

  def private_mth
    puts "#{self.class}: This is private, be careful!"
  end

  public :test
  private :private_mth
  protected :protected_mth
end

class Subpravicy < Privacy
  def runtest
    protected_mth
    private_mth

    self.protected_mth
    #self.private_mth     #Error

    subfan = Subpravicy.new
    subfan.public_mth
    subfan.protected_mth
    #subfan.private_mth       #Error
  end
end

class Totest
  def runtest
    fan = Privacy.new
    fan.public_mth
    #fan.protected_mth          #Error
    #fan.private_mth            #Error
  end
end

puts "*************************************************"
Privacy.new.runtest
puts "*************************************************"
Subpravicy.new.runtest
puts "*************************************************"
Totest.new.runtest