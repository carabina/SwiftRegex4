//: Regexies represented as a String subscript on a String

var input = "Now is the time for all good men to come to the aid of the party"

// basic regex match
if input["\\w+"] {
    print("match")
}

// receiving type controls data you get
if let firstMatch: Substring = input["\\w+"] {
    print("match: \(firstMatch)")
}

if let groupsOfFirstMatch: [Substring?] = input["(all) (\\w+)"] {
    print("groups: \(groupsOfFirstMatch)")
}

if let allGroupsOfAllMatches: [[Substring?]] = input["(\\w)(\\w*)"] {
    print("allGroups: \(allGroupsOfAllMatches)")
}

// Matches only can be fetched with non-optional Substring array
if let allMatches: [Substring] = input["\\w+"] {
    print("words: \(allMatches)")
}

// regex replace by assignment
input["men"] = "folk"
print(input)

// replace just the first two matches
input["\\w+"] = ["yesterday", "was"]
print(input)

// individual groups can be accessed
input["(all) (\\w+)", 2]

// and assigned to
input["the (\\w+)", 1] = "_$1_"
print(input)

// or replaced using a closure
input["(_?)(\\w)(\\w*)"] = {
    (groups, stop) in
    return groups[1]!+groups[2]!.uppercased()+groups[3]!
}
print(input)

// parsing a properties file
let props = """
    name1 = value1
    name2 = value2
    """

var params = [String: String]()
for groups in props["(\\w+)\\s*=\\s*(.*)"] {
    params[String(groups[1]!)] = String(groups[2]!)
}
print(params)
