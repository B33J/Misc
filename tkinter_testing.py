# Comments
from tkinter import *

master = Tk()
#master.geometry('500x420')
master.resizable(width=False, height=False)
master.title('Python RPG')

## Declare a bunch of stuff
#player equipment
invRing = "None"
invHelmet = "None"
invChest = "None"
invWeapon = "None"
invShield = "None"
invNecklace = "None"

#player stats
playerXP = 100
playerXPforLevel = 150
playerHP = 45
playerHPMax = 50
playerLvl = 1

#player skills
playerChopXP = 0
playerForageXP = 0
playerMineXP = 0
playerFishXP = 0
playerChopLvl = 1
playerForageLvl = 1
playerMineLvl = 1
playerFishLvl = 1

v = StringVar(value="New text!")
Label(master, textvariable=v)

textStats = StringVar(value=
	"Health: " + str(playerHP) + "/" + str(playerHPMax) + "HP" + "\n" +
	"Level: " + str(playerLvl) + "\n" + 
	"XP: " + str(playerXP) + "/" + str(playerXPforLevel) + "\n" + 
	"Ring: " + invRing + "\n" + 
	"Helmet: " + invHelmet + "\n" + 
	"Chest: " + invChest + "\n" + 
	"Weapon: " + invWeapon + "\n" + 
	"Shield: " + invShield + "\n" + 
	"Necklace: " + invNecklace
	)
#Console text box input get
def get(event):
	print(EntryTextInput.get())
	textInput = EntryTextInput.get()
	labelConsole.insert(END, textInput)
	EntryTextInput.delete(0,END)

def buttonQuit():
	master.destroy()

def buttonInventory():
	labelStats.grid_forget()
	labelInv.grid(column=1, row=1, sticky=W+E+N+S)
	
def buttonStats():
	labelInv.grid_forget()
	labelStats.grid(column=1, row=1, sticky=W+E+N+S)
	textStatsWindow.grid(column=1, row=1, sticky=W+N)


labelStatus = Label(master, relief=GROOVE, anchor=W, text="Hello warld - Status stuff").grid(column=0, row=0, columnspan=2, sticky=W+E)

labelConsole = Label(master, relief=SUNKEN, anchor=NW, justify=LEFT, wraplength=300, text="Please enter your name to get started!")
labelConsole.grid(column=0, row=1, sticky=W+E+N+S, ipady=120, ipadx=10)

labelStats = LabelFrame(master, relief=GROOVE, text="Statistics")
#labelStats = Label(master, relief=GROOVE, anchor=NW, justify=LEFT, text="Statistics ")
labelStats.grid(column=1, row=1, sticky=W+E+N+S)
textStatsWindow = Label(labelStats, textvariable=textStats, justify=LEFT)
textStatsWindow.grid(column=1, row=1, sticky=W+N)

labelInv = LabelFrame(master, relief=GROOVE, text="Inventory", container=TRUE)
#labelInv = Label(master, relief=GROOVE, anchor=NW, justify=LEFT, text="Inventory")
#.grid(column=1, row=1, sticky=W+E+N+S, ipadx=50)

EntryTextInput = Entry(master, relief=SUNKEN, bg="white", text="Text input for commands")
EntryTextInput.bind("<Return>", get)
EntryTextInput.grid(column=0, row=2, sticky=W+E, ipady=5)

buttonQuit = Button(master, text="Quit", command=buttonQuit).grid(column=1, row=2, sticky=E)
buttonInventory = Button(master, text="Inventory", command=buttonInventory).grid(column=1, row=2, sticky=W, padx=40)
buttonStats = Button(master, text="Stats", command=buttonStats).grid(column=1, row=2, sticky=W)

# Put this generally at the bottom of code
master.mainloop()

# def SetPlayerName():
	# global lbl
	# global usernameField
	
	# playerName = usernameField.get()
	# #print(InputExcept)
	# labelUseThisNameQ.pack(pady=10, padx=10)
	# lbl.config(text=playerName)
	# #lbl.pack()
	# #BtnPlayerNameAccept.pack()

# def Quitting():
	# master.destroy()
	
# def AcceptPlayerName():
	# labelIntro.destroy()
	# labelUseTHisNameQ.destroy()
	# Btn1.destroy()
	# BtnQuit.pack(anchor=SE, padx=10, pady=10)
	# #BtnQuit.grid(row=1 column=1)
	# BtnPlayerNameAccept.destroy()

# labelIntro = Label(master, anchor=W, justify=LEFT, text="Welcome to Python RPG! \nPlease enter your Playername to get started.")
# labelIntro.pack(pady=10, padx=10)

# labelUseThisNameQ = Label(master, anchor=W, justify=LEFT, text="Do you want to use this name?")


# lbl = Label(master, width="35", bg="white", anchor=W, justify=LEFT)
# #lbl.pack()

# usernameField = Entry(master, relief=SUNKEN)
# usernameField.pack()

# Btn1 = Button(master, text="OK", command=SetPlayerName)
# Btn1.pack(ipadx=5)

# BtnQuit = Button(master, text="Quit", command=Quitting)
# BtnQuit.pack(anchor=SE, padx=10, pady=10)

# BtnPlayerNameAccept = Button(master, text="Accept", command=AcceptPlayerName)



# Comments

# from tkinter import *

# colours = ['red','green','orange','white','yellow','blue']

# r = 0
# for c in colours:
    # Label(text=c, relief=RIDGE,width=15).grid(row=r,column=0)
    # Entry(bg=c, relief=SUNKEN,width=10).grid(row=r,column=1)
    # r = r + 1

# mainloop()

# class Application(Frame):
	# def say_hi(self):
		# print("hi there, everyone!")
		# labelthing = Label(root,text="Hello everyone!")
		# labelthing.pack()

	# def createWidgets(self):
		# self.QUIT = Button(self)
		# self.QUIT["text"] = "QUIT"
		# self.QUIT["fg"]   = "red"
		# self.QUIT["command"] =  self.quit
		
		# self.QUIT.pack({"side": "left"})
		
		# self.hi_there = Button(self)
		# self.hi_there["text"] = "Hello",
		# self.hi_there["command"] = self.say_hi
		
		# self.hi_there.pack({"side": "left"})

	# def __init__(self, master=None):
		# Frame.__init__(self, master)
		# self.pack()
		# self.createWidgets()

# root = Tk()
# app = Application(master=root)
# app.mainloop()
# root.destroy()

