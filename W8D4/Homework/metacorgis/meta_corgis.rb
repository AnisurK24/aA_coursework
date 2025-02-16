class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end
require 'byebug'
  def treat_stuff(treat_name)
    puts "woooooooooo"
    treat_name = treat_name.to_s
    # debugger

    treat_info = @snack_box.send("get_#{name}_info", @box_id)
    
    treat_tastiness = @snack_box.send("get_#{name}_tastiness", @box_id)

    result = "#{treat_name}: #{treat_info}: #{treat_tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end



  def method_missing(name, *args)

    snacks_arr = ["bone", "treat", "kibble"]

    if snacks_arr.include?(name.to_s)
      p 'weeeeee'
       self.send(self.treat_stuff(name))
    else
      raise 'this is an errr'#noMethodErr
    end


  end


  def self.define_snack(name)
    # Your code goes here...
  end
end

# class Cat
#   def say(anything)
#     puts anything
#   end

#   def method_missing(method_name)
#     method_name = method_name.to_s
#     if method_name.start_with?("say_")
#       text = method_name[("say_".length)..-1]

#       say(text)
#     else
#       # do the usual thing when a method is missing (i.e., raise an
#       # error)
#       super
#     end
#   end
# end




class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  # phase 1
  # def method_missing(name, *args)
  #   info = @snack_box.send("get_#{name}_info", @box_id)
  #   tastiness = @snack_box.send("get_#{name}_tastiness", @box_id)
  #   name = "#{name.to_s.split('_').map(&:capitalize).join(' ')}"
  #   result = "#{name}: #{info}: #{tastiness} "
  #   tastiness > 30 ? "* #{result}" : result
  # end

  # phase 2
  def self.define_snack(name)
    define_method(name) do
      info = @snack_box.send("get_#{name}_info", @box_id)
      tastiness = @snack_box.send("get_#{name}_tastiness", @box_id)
      display_name = "#{name.split('_').map(&:capitalize).join(' ')}"
      result = "#{display_name}: #{info}: #{tastiness}"
      tastiness > 30 ? "* #{result}" : result
    end
  end
end