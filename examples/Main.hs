import Control.Monad
import System.Plugins.Hotswap

main :: IO ()
main = do
    inputHandler <- newPlugin "Plugin.o" [] "inputHandler" :: IO (Plugin (String -> String))

    forever $ do
        l <- getLine
        if l == "RELOAD"
            then reloadPlugin inputHandler
            else putStrLn =<< usePlugin inputHandler l
