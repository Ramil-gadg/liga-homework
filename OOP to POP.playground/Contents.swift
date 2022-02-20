import UIKit

/// задаем протокол Personn
protocol Personn {
    typealias Statistics = (
        armor: Float,
        attackPower: Float,
        strength: Float,
        agility: Float,
        intelligence: Float,
        hitPoints: Float,
        mana: Float
    )
    
    var guildType: GuildType { get }
    var name: String { get }
    var armor: Float { get set }
    var attackPower: Float { get set }
    var strength: Float { get set }
    var agility: Float { get set }
    var intelligence: Float { get set }
    var hitPoints: Float { get set }
    var mana: Float { get set }
    var currentPosition: CGPoint? { get set }
    
    init(guildType: GuildType, statistics: Statistics)
    
    ///методы с одинаковой реализацией для всех персонажей
    func stop()
    func info()
    mutating func movee(to point: CGPoint)
    mutating func fly(to point: CGPoint)
    mutating func updateStatistics(_ statistics: Statistics)
    
    ///методы с различной реализацией для персонажей
    func attack() -> String
    func ultimate() -> String
}

/// реализовываем методы и вычисляемые свойства протокола
extension Personn {
    
    var name: String {
        switch guildType {
        case .alliance(let gtype):
            return gtype.rawValue
        case .orc(let gtype):
            return gtype.rawValue
        }
    }
    
    func attack() -> String {
        switch guildType {
        case .alliance(let gtype):
            return gtype.getAtak()
        case .orc(let gtype):
            return gtype.getAtak()
        }
    }
    
    func ultimate() -> String {
        switch guildType {
        case .alliance(let gtype):
            return gtype.getUltimate()
        case .orc(let gtype):
            return gtype.getUltimate()
        }
    }
    
    func info() {
        print("\(String(describing: self))")
    }
    
    mutating func movee(to point: CGPoint) {
        print("moved to point \(point)")
        currentPosition = point
    }
    
    mutating func fly(to point: CGPoint) {
        print("flew to point \(point)")
        currentPosition = point
    }
    
    func stop() {
        print("stop")
    }
    
    mutating func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
}

///создаем Enum для определения типа гильдии и входящих в нее персонажей
enum GuildType {
    case alliance(AlliancePersonDiff)
    case orc(OrcPersonDiff)
    
    var isAliance: Bool {
        switch self {
        case .alliance:
            return true
        default:
            return false
        }
    }
    
    var isOrc: Bool {
        switch self {
        case .orc:
            return true
        default:
            return false
        }
    }
}

///создаем протокол, описывающий методы, отличающиеся  для разных персонажей
protocol GuildDifferencies {
    func getAtak() -> String
    func getUltimate() -> String
}

///создаем Enum с реализацией отличающихся методов для конкретного типа гильдии с персонажами
enum AlliancePersonDiff: String, GuildDifferencies {
    case archmage = "Archmage"
    case mountainKing = "Mountain King"
    case paladin = "Paladin"
    case bloodMage = "Blood Mage"
    
    func getAtak() -> String {
        switch self {
        case .archmage:
            return "long-range attack"
        case .mountainKing:
            return "melee attacks"
        case .paladin:
            return "quick attack"
        case .bloodMage:
            return "black magic attack"
        }
    }
    
    func getUltimate() -> String {
        switch self {
        case .archmage:
            return "Avatar"
        case .mountainKing:
            return "Mass Teleport"
        case .paladin:
            return "Devotion Aura"
        case .bloodMage:
            return "Flame Strike"
        }
    }
}

///создаем Enum с реализацией отличающихся методов для конкретного типа гильдии с персонажами
enum OrcPersonDiff: String, GuildDifferencies {
    case greatHall = "Great Hall"
    case burrow = "Orc Burrow"
    case warMill = "War Mill"
    
    func getAtak() -> String {
        switch self {
        case .greatHall:
            return "5x damage"
        case .burrow:
            return "huge damage"
        case .warMill:
            return "destroy all living things"
        }
    }
    
    func  getUltimate() -> String {
        switch self {
        case .greatHall:
            return "Spiked Barricades"
        case .burrow:
            return "Battle Stations"
        case .warMill:
            return "Return Lumber"
        }
    }
}

///создаем структуру Personn
struct Person: Personn {

    let uuid = UUID().uuidString
    var guildType: GuildType
    var armor: Float
    var attackPower: Float
    var strength: Float
    var agility: Float
    var intelligence: Float
    var hitPoints: Float
    var mana: Float
    var currentPosition: CGPoint?
    
    init(guildType: GuildType, statistics: Statistics) {
        self.guildType = guildType
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
}

///подписываем под протокол Hashable для хранения в качестве ключа словаря
extension Person: Hashable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

var someBurrow = Person(guildType: .orc(.burrow),
                        statistics: (
                            armor: 3,
                            attackPower: 5,
                            strength: 2,
                            agility: 1,
                            intelligence: 7,
                            hitPoints: 56,
                            mana: 5
                        )
)

var someWarMill = Person(guildType: .orc(.warMill),
                         statistics: (
                            armor: 12,
                            attackPower: 55,
                            strength:43,
                            agility: 94,
                            intelligence: 19,
                            hitPoints: 49,
                            mana: 51
                         )
)

var blood = Person(guildType: .alliance(.bloodMage),
                   statistics: (
                    armor: 12,
                    attackPower: 45,
                    strength: 6,
                    agility: 45,
                    intelligence: 12,
                    hitPoints:89,
                    mana:42
                   )
)

var arch = Person(guildType: .alliance(.archmage),
                  statistics: (
                    armor: 73,
                    attackPower: 19,
                    strength: 31,
                    agility: 11,
                    intelligence: 61,
                    hitPoints: 96,
                    mana: 50
                  )
)

var mountainm = Person(guildType: .alliance(.mountainKing),
                       statistics: (
                        armor: 39,
                        attackPower: 15,
                        strength: 92,
                        agility: 11,
                        intelligence: 33,
                        hitPoints: 36,
                        mana: 92
                       )
)

print(mountainm.ultimate())
print(arch.attack())
print(blood.attack())
print(someBurrow.attack())

var persons = [blood, someWarMill, mountainm, arch, someBurrow]

let alliancePersons = persons.filter {$0.guildType.isAliance}

let orcPersons = persons.filter {$0.guildType.isOrc}

let sortedPersons = persons.sorted {$0.mana > $1.mana}

let theStrongest = persons.max {$0.mana < $1.mana}

var personsDict = [someBurrow : "Персонаж для тренировок"]
personsDict[someWarMill] = "Любимый персонаж"
personsDict[mountainm] = "Персонаж друга"
personsDict[blood] = "Для проффесиональной игры"

for (key, value) in personsDict {
    print("\(value) - \(key.name)")
}
