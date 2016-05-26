class ClassSuper  
    attr_accessor :attr1  
    
    def initialize  
        @attr1 = "attr1"  
    end  
  
    def publicMethod
        puts "this is public which can be invoked"
    end


    def privateMethod  
        puts "this is private may be limited"  
    end  
  
  
     
    def protectedMethod  
        puts "this is protected may be limited"  
    end  

    def runtest
      
      self.publicMethod
      self.protectedMethod
      privateMethod           #It can work
      #self.privateMethod     #Error

      obj = ClassChild.new
      obj.publicMethod
      obj.protectedMethod
      #obj.privateMethod      #Error
    end


    public:publicMethod
    protected:protectedMethod
    private:privateMethod
end  
  
class ClassChild < ClassSuper  
  
    public   
    def callProtected  
        protectedMethod  
    end  
  
    def callPrivate  
        privateMethod  
    end  
  
end  

# ClassSuper.new.runtest
b=ClassSuper.new
b.publicMethod
# b.protectedMethod  #Error
# b.privateMethod    #Error
# b.privateMethod    #Error
a=ClassChild.new  
# a.privateMethod    #Error
#a.protectedMethod   #Error
a.callProtected  
a.callPrivate        #private method is also inherited  
# a.privateMethod    #Error  
# a.protectedMethod  #Error
  
