
local terms = {
-- A
-- B
  "bottom type",
-- C
  "closed table type",
  "coercion",
  "consistency",
  "consistent-subtyping",
  "contravariant",
  "covariant",
-- D
  "depth subtyping",
  "dynamic type",
-- E
-- F
  "filter type",
  "fixed table type",
  "flow typing",
  "free assigned variable",
-- G
  "gradual type system",
  "gradual typing",
-- H
-- I
  "invariant",
-- J
-- K
-- L
-- M
  "metatable",
-- N
  "nominal type system",
-- O
  "open table type",
  "optional type system",
-- P
  "projection environment",
  "projection type",
  "prototype object",
-- Q
-- R
-- S
  "self-like delegation",
  "sound type system",
  "structural type system",
-- T
  "table refinement",
  "top type",
  "type environment",
  "type tag",
-- U
  "unique table type",
  "unsound type system",
  "userdata",
-- V
  "vararg expression",
  "variadic function",
  "variance",
-- W
  "width subtyping",
-- X
-- Y
-- Z
}

local def = {
-- A
-- B
  ["bottom type"] = [[
It is a type that is subtype of all types.
]],
-- C
  ["closed table type"] = [[
It is the type of table annotations in Typed Lua.
A closed table type does not provide any guarantees about keys
with types not listed in the table type.
It also does not allow table refinement to add fields to the table type. 
]],
  ["coercion"] = [[
It is a relation that allows converting values from one type to values
of another type without error.
]],
  ["consistency"] = [[
Gradual typing uses the consistency relation to check the interaction
among the dynamic type and other types.
This relation allows us combining dynamic and static typing in the
same language, but still catching static type errors.
The consistency relation is reflexive and symmetric, but it is not transitive
to prevent that casts from a static type to the dynamic type can be
combined with casts from the dynamic type to another static type. 
]],
  ["consistent-subtyping"] = [[
It is a relation that combines consistency and subtyping, allowing
the definition of gradual type systems for object-oriented languages.
Like the consistency relation, it is reflexive and symmetric, but it is not transitive.
]],
  ["contravariant"] = [[
Subtyping is contravariant when it reverses the subtyping order,
that is, a subtyping rule is contravariant when it orders
types from more generic types (supertypes) to more specific types (subtypes).
]],
  ["covariant"] = [[
Subtyping is covariant when it preserves the subtyping order,
that is, a subtyping rule is covariant when it orders
types from more specific types (subtypes) to more general types (supertypes).
]],
-- D
  ["depth subtyping"] = [[
It allows the supertype to vary the type of individual fields in the subtype.
]],
  ["dynamic type"] = [[
It is a type that allows combining dynamic and static typing in the same code.
It is neither the bottom nor the top type in the subtyping relation, but
a subtype only of itself.
Gradual typing uses the dynamic type along with the consistency relation to
identify the parts of the code where run-time casts should be inserted to
prevent that dynamically typed code violates statically typed code.
]],
-- E
-- F
  ["filter type"] = [[
It is a type that allows Typed Lua to discriminate the type of local variables
inside control flow statements, as these variables are bound to unions of
first-level types.
]],
  ["fixed table type"] = [[
It is the type of classes in Typed Lua.
It is a table type that does not allow width subtyping to make single
inheritance safe.
It also does not allow table refinement to add fields to the table type. 
]],
  ["flow typing"] = [[
It is a combination of static typing and flow analysis to allow variables
to have different types at different parts of the program.
]],
  ["free assigned variable"] = [[
It is a free variable that appears in an assignment.
]],
-- G
  ["gradual type system"] = [[
It is a type system that uses the consistency relation instead of type equality
to perform static type checking.
]],
  ["gradual typing"] = [[
It is an approach that uses a gradual type system to allow static and dynamic
typing in the same code, but inserting run-time checks between statically
typed and dynamically typed code.
These run-time checks ensure that dynamically typed code does not violate
statically typed code.
More precisely, gradual typing allows programmers to change between
dynamic and static typing without changing the dynamic or the static behavior
of the program.
]],
-- H
-- I
  ["invariant"] = [[
Subtyping is invariant when it does not allow ordering types, that is,
it is a way to define type equality through subtyping.
]],
-- J
-- K
-- L
-- M
  ["metatable"] = [[
It is a Lua table that allows changing the behavior of other tables
it is attached to.
]],
-- N
  ["nominal type system"] = [[
It is a type system that uses the name of the types to check the
compatibility among them.
]],
-- O
  ["open table type"] = [[
It is the type of the tables with keys that do not inhabit one of
the table's key types, and have at least one alias.
It also allows table refinement to add fields to the table type. 
]],
  ["optional type system"] = [[
It is a type system that allows combining static and dynamic typing in the same
language, but without affecting the run-time semantics.
This means that the programmer has the option to use or not use its
static analysis to check for static type errors, as these errors
will be caught by the run-time semantics anyway.
]],
-- P
  ["projection environment"] = [[
It is an environment that Typed Lua uses to handle unions of second-level
types that are bound to projection types.
]],
  ["projection type"] = [[
It is a type that allows Typed Lua to discriminate the type of local variables
that have a dependency relation, as they project an union of second-level types
into unions of first-level types.
These unions of second-level types can describe the type of several local variables.
A projection type uses an index to define which components of a union of second-level
types should be used to project the union of first-level types of a local variable.
When programmers discriminate a projection type, they are discriminating the
union of second-level types that is bound to this projection type, affecting
all variables that bind to the same projection type, which also bind to the
same union of second-level types.
]],
  ["prototype object"] = [[
It is an object that works like a class, that is, it is an object from
which other objects inherit its attributes.
]],
-- Q
-- R
-- S
  ["self-like delegation"] = [[
It is a technique to implement inheritance in dynamically typed languages
through prototype objects. 
In this technique, when an object tries to access an attribute that is not
present, it looks for this attribute in its parent object.
]],
  ["sound type system"] = [[
It is a type system that does not type check all programs that contain a type error.
]],
  ["structural type system"] = [[
It is a type system that uses the structure of types to check the compatibility among them.
]],
-- T
  ["table refinement"] = [[
It is an operation from Typed Lua that allows programmers to change a table type
to include new fields or to specialize existing fields.
]],
  ["top type"] = [[
It is a type that is supertype of all types.
]],
  ["type environment"] = [[
It is an environment that Typed Lua uses to assign variable names to first-level types.
]],
  ["type tag"] = [[
In dynamically typed languages, a type tag describes the type of a value during run-time.
]],
-- U
  ["unique table type"] = [[
It is the table type that describes the type of a table constructor.
It is the type of the tables with keys that do not inhabit one of
the table's key types, and that does not have any alias.
It also allows table refinement to add fields to the table type. 
]],
  ["unsound type system"] = [[
It is a type system that type checks certain programs that contain type errors.
]],
  ["userdata"] = [[
It is a Lua data type that allows Lua variables to hold values from applications
or libraries that are written in C.
]],
-- V
  ["vararg expression"] = [[
It is a Lua expression that can result in an arbitrary number of values.
]],
  ["variadic function"] = [[
It is a Lua function that can receive an arbitrary number of arguments.
]],
  ["variance"] = [[
It is the way types are ordered.
]],
-- W
  ["width subtyping"] = [[
It allows the subtype to have fields that do not exist in the supertype.
]],
-- X
-- Y
-- Z
}

table.sort(terms)

io.write("\\begin{description}\n")
for k, v in ipairs(terms) do
  io.write(string.format("\\item[%s] %s\n", v, def[v] or "TO DO."))
end
io.write("\\end{description}\n")
