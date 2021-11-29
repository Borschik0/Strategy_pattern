enum Characters { elf, dwarf, knight, mainCharacter }

Map<Object, String> greetings = {
  Characters.elf: 'ELf Kerillian:\nI am the most agile of the elves!',
  Characters.dwarf: 'Dwarf Bardin:\nI\'m a dwarf!',
  Characters.knight: 'Knight Markus:\nI am the greatest knight!',
  Characters.mainCharacter: 'Main Character:\nHave mercy'
};

abstract class WeaponBehavior {
  void useWeapon();
}

class Sword implements WeaponBehavior {
  @override
  void useWeapon() => print('This sword gives me strength!');
}

class Bow implements WeaponBehavior {
  @override
  void useWeapon() => print('My arrows will hit anyone!');
}

class Hammer implements WeaponBehavior {
  @override
  void useWeapon() => print('This hammer will crush you!');
}

class NoWeapon implements WeaponBehavior {
  @override
  void useWeapon() => print('I\'m unarmed!');
}

abstract class Attacking {
  WeaponBehavior _weapon = NoWeapon();

  void set weapon(weapon) {
    _weapon = weapon;
  }

  void say();

  void fight() {
    _weapon.useWeapon();
  }
}

class Elf extends Attacking {
  @override
  void say() {
    print(greetings[Characters.elf]);
  }
}

class Knight extends Attacking {
  @override
  void say() {
    print(greetings[Characters.knight]);
  }
}

class Dwarf extends Attacking {
  @override
  void say() {
    print(greetings[Characters.dwarf]);
  }
}

class MainCharacter extends Attacking {
  @override
  void say() {
    print(greetings[Characters.mainCharacter]);
  }
}

void main() {
  Elf elf = new Elf();
  Knight knight = new Knight();
  Dwarf dwarf = new Dwarf();
  MainCharacter mainCharacter = new MainCharacter();

  mainCharacter.say();
  mainCharacter.fight();
  print('---' * 8);
  elf.say();
  elf.weapon = new Bow();
  elf.fight();
  print('---' * 8);
  dwarf.say();
  dwarf.weapon = new Hammer();
  dwarf.fight();
  print('---' * 8);
  knight.say();
  knight.weapon = new Sword();
  knight.fight();
  print('---' * 8);
  dwarf.say();
  dwarf.weapon = new NoWeapon();
  dwarf.fight();
  print('---' * 8);
  mainCharacter.say();
  mainCharacter.weapon = new Sword();
  mainCharacter.fight();
}
