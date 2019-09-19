{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
import Text.XML
import Text.Hamlet.XML
import qualified Data.Map as M
import qualified Text.XML.Stream.Render as R

getHomeR :: Handler TypedContent
getHomeR = selectRep $ do
    provideRep $ return $ repXml $ renderText rs (getXml 10)

getXml :: Int -> Document
getXml n = Document p elm []
    where
        p = Prologue [] Nothing []
        elm = Element "root" M.empty [xml|
<params>
    <param>#{pack $ show n}
    <param>yyy
|]

rs :: R.RenderSettings
rs = def -- R.RenderSettings True (rsAttrOther def) (rsUserCDATA def) False
