@dynamicMemberLookup
public struct JSLetDeclarator: Sendable {
  let letName: String

  public subscript(dynamicMember member: String) -> JSLetDeclarator {
    JSLetDeclarator(letName: member)
  }
}

@dynamicMemberLookup
public struct JSVarDeclarator: Sendable {
  let name: String

  public subscript(dynamicMember member: String) -> JSVarDeclarator {
    JSVarDeclarator(name: member)
  }
}

public let `let` = JSLetDeclarator(letName: "")
public let `var` = JSVarDeclarator(name: "")
