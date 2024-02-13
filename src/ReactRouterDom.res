type route = {
  path: string,
  element: React.element,
}

module Root = {}

module Route = {
  type rec t = {
    path: string,
    element: React.element,
    children: array<t>,
  }

  let make = (~path, ~element, ~children: array<t>) => {path, element, children}

  module Component = {
    @module("react-router-dom") @react.component
    external make: (
      ~path: string,
      ~element: React.element,
      ~children: React.element=?,
    ) => React.element = "Route"
  }
}

module Routes = {
  @module("react-router-dom") @react.component
  external make: (~children: React.element) => React.element = "Routes"
}

module Router = {
  type t

  @module("react-router-dom")
  external createBrowserRouter: array<Route.t> => t = "createBrowserRouter"
}

module RouterProvider = {
  @module("react-router-dom") @react.component
  external make: (~router: Router.t) => React.element = "RouterProvider"
}

type options = {
  replace?: bool,
  preventScrollReset?: bool,
  relative?: string,
}

@module("react-router-dom")
external useParams: unit => 'a = "useParams"

type searchParams = {
  get: string => string,
  getAll: string => array<string>,
  has: string => bool,
  entries: unit => array<(string, string)>,
  keys: unit => array<string>,
  values: unit => array<string>,
  append: (string, string) => unit,
  delete: string => unit,
  set: (string, string) => unit,
  sort: unit => unit,
  toString: unit => string,
}

@module("react-router-dom")
external useNavigateToRoute: unit => (string, option<options>) => unit = "useNavigate"

@module("react-router-dom")
external useNavigateHistory: unit => (int, option<options>) => unit = "useNavigate"

module Link = {
  @module("react-router-dom") @react.component
  external make: (~to: string, ~children: React.element) => React.element = "Link"
}

module Navigate = {
  @module("react-router-dom") @react.component
  external make: (~to: string, ~replace: bool=?, ~preventScrollReset: bool=?) => React.element =
    "Navigate"
}

module SearchParams = {
  type t
  type setSearchParams = (t => t) => unit

  @new external make: array<(string, string)> => t = "URLSearchParams"

  @send external get: (t, string) => option<string> = "get"
  @send external getAll: (t, string) => list<string> = "getAll"
  @send external has: (t, option<string>) => bool = "has"
  @send external entries: t => Js.Array2.array_like<(string, string)> = "entries"
  @send external keys: t => Js.Array2.array_like<string> = "keys"
  @send external values: t => Js.Array2.array_like<string> = "values"
  @send external append: (t, string, string) => unit = "append"
  @send external delete: (t, string) => unit = "delete"
  @send external set: (t, string, string) => unit = "set"

  @module("react-router-dom")
  external useSearchParams: unit => (t, setSearchParams) = "useSearchParams"
}

module Location = {
  type t = {search: string}

  @module("react-router-dom")
  external useLocation: unit => t = "useLocation"
}

module Outlet = {
  @module("react-router-dom") @react.component
  external make: unit => React.element = "Outlet"
}
