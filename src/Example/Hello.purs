module Example.Hello where

import Example.Prelude

import Data.Const (Const)
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

type Query = Const Void

data Action
  = Toggle

type State =
  { editing :: Boolean
  }

type HTML = H.ComponentHTML Action () Aff

initialState :: State
initialState =
  { editing: true
  }

render :: State -> HTML
render state =
  HH.div
  [ class_ "text-base font-bold"]
  [ HH.a
    ( if state.editing
      then
        []
      else
        [ HP.href "https://github.com"]
    )
    [ HH.text "hello" ]
  , HH.button
    [ HE.onClick $ Just <<< const Toggle ]
    [ HH.text "toggle"]
  ]

component :: H.Component HH.HTML Query Unit Void Aff
component = H.mkComponent
  { initialState: const initialState
  , render
  , eval: H.mkEval H.defaultEval
      { handleAction = handleAction }
  }
  where
  handleAction = case _ of
    Toggle ->
      H.modify_ \s -> s { editing = not s.editing }
