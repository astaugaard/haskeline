module System.Console.Haskeline.AppBindings where

import System.Console.Haskeline.Command
import System.Console.Haskeline.InputT
import System.Console.Haskeline.LineState
import System.Console.Haskeline.Monads

import Data.Maybe


runUserBindings :: Monad m => Command (InputCmdT m) InsertMode InsertMode
runUserBindings im =
  do b <- asks appBindings
     keyCommand (KeyMap
       (\k -> Just $
         fromMaybe
           (NotConsumed pure)
           (lookupKM b k))) im

