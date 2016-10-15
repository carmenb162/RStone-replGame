# Death/Survive
def death
  puts "You have died."
end

def chapter1
  puts "Oh damn. Glad to hear from you. You need to fix the spin of your ship."
  puts "*You can see earth passing by your window repeatedly.*
*The control panel is not happy with you.*
*Your vision is narrowing again from the lack of blood*
*You reach out, there are 2 blinking buttons*
Red or blue?"
  choice = gets.chomp
  red_or_blue(choice)
end

def red_or_blue(choice)
  if choice == "red"
      puts <<~text
        *The ship begins rumbling*
        *A loud creaking sound reverberates through the ship*
        Headset: Captain, the back of your ship just broke free. Did you press any buttons?
      text
      press_button?(gets)
  elsif choice == "blue"

  else
    death()
  end

end

press_button?(input)
  if input == "yes"
    puts <<~text


    text
red_or_blue("red")

def chapter_creator(text, if_true, if_false)
chapters = []

c1 = {
  text:
}
