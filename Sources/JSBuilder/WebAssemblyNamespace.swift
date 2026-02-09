#if !os(WASI)

@dynamicMemberLookup
public struct WebAssemblyNamespace: Sendable {
    public struct Memory: JSValueProtocol {
        let initial: Int
        let maximum: Int?

        public init(initial: Int, maximum: Int? = nil) {
            self.initial = initial
            self.maximum = maximum
        }

        public var expression: JSExpression {
            var props: [(String, JSExpression)] = [
                ("initial", .number(Double(initial)))
            ]
            if let maximum = maximum {
                props.append(("maximum", .number(Double(maximum))))
            }
            return .new("WebAssembly.Memory", [.object(props)])
        }
    }

    // Wrapper to allow WebAssembly.Memory() syntax
    public struct MemoryConstructor {
        public func callAsFunction(initial: Int, maximum: Int? = nil) -> Memory {
            Memory(initial: initial, maximum: maximum)
        }
    }

    public var Memory: MemoryConstructor {
        MemoryConstructor()
    }

    // Instance subscript for accessing WebAssembly methods like instantiate
    public subscript(dynamicMember name: String) -> JSIdentifier {
        JSIdentifier("WebAssembly.\(name)")
    }
}

public let WebAssembly = WebAssemblyNamespace()

#endif
