class UserData:
    def __init__(self, name, type_of_acc):
        self.name = name
        self.type_of_acc = type_of_acc
    
    def visiting(self, likes):
        self.likes = likes
        if self.likes >= 500:
            self.name = "Adventurer " + self.name
        elif self.likes >= 100:
            self.name = "Trecker " +self.name
        elif self.likes >= 15:
            self.name = "Tourist " + self.name
                
    def finding(self, finds):
        self.finds = finds
        if self.finds >=100:
            self.name = "Columbus " + self.name
        elif self.finds >= 25:
            self.name = self.name + " the Explora"
        elif self.finds >= 5:
            self.name = "Discoverer " + self.name
            
    def popUp(self, shows):
        self.shows = shows
        if shows >= 50:
            self.name = "Rockstar " + self.name
        elif self.shows >= 10:
            self.name = "Up and Coming " + self.name
        elif shows >= 500:
            self.name = "Talented " + self.name        
        
p1 = UserData("Varun", 'Artist')
p2 = UserData("Prithvi", 'Normal Acc')
p3 = UserData("Pranshu", 'Normal Acc')
p1.visiting(666)
p2.finding(47)
p3.popUp(69)
print(p1.name)
print(p2.name)
print(p3.name)
