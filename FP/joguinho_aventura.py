def intro():
    print("After a drunken night out with friends, you awaken in a thick, dank forest. A slobbering orc is running towards you.\nA. Grab a nearby rock and throw it at the orc\nB. Lie down and wait to be mauled\nC. Run")
    answer=str(input())
    if answer=="A" or answer=="a": return option_rock()
    elif answer=="B" or answer=="b": print("Welp, that was quick. You died!")
    elif answer=="C" or answer=="c": return option_run()
def option_rock():
    print("The orc is stunned, but regains control. He begins running towards you again.\nA. Run\nB. Throw another rock\nC. Run towards a nearby cave")
    answer=str(input())
    if answer=="A" or answer=="a": return option_run()
    elif answer=="B" or answer=="b": print("The rock flew well over the orcs head. You missed. You died!")
    else: return option_cave()
def option_run():
    print("You run as quickly as possible.\nA. Hide behind boulder\nB. Trapped, so you fight\nC. Run towards an abandoned town")
    answer=str(input()) 
    if answer=="A" or answer=="a": print ("You're easily spotted. You died!")
    elif answer=="B" or answer=="b": print("You're no match for an orc. You died!")
    elif answer=="C" or answer=="c": return option_town()
def option_town():
    print("You notice a purple flower near your foot. Do you pick it up? Y/N")
    answer=str(input())
    if answer=="Y" or answer=="y": 
        print("You quickly hold out the purple flower. The orc was looking for love. This got weird, but you survived!")
    else:
        print("Maybe you should have picked up the flower. You died!")

def option_cave():
    print("Before you fully enter, you notice a shiny sword on the ground. Do you pick up a sword. Y/N?")
    answer=str(input())
    if answer=="Y" or answer=="y": sword=True
    else: sword=False
    print("What do you do next?\nA. Hide in silence\nB. Fight\nC. Run")
    answer2=str(input())
    if answer2=="A"or answer=="a": return("I think orcs can see very well in the dark, right? You died!")
    elif answer2=="B"  and sword==True: return("As the orc reached out to grab the sword, you pierced the blade into its chest. You survived!")
    elif answer2=="B" and sword==False: return("You're defenseless. You died!")
    else: 
        print("The orc turns around and sees you running.") 
        return option_run()
intro()