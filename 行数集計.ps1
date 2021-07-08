<#
    ファイル行数カウントスクリプト
    サブフォルダ内のファイルの行数をカウントした一覧csvを作成
#>

#対象のパス
$PATH = $PSScriptRoot #スクリプトのあるパス
#$PATH = "C:\Users\hoge\Desktop\test"

#対象ファイルの拡張子
$Ext = '*.csv'

#レコード件数算出用に総行数から控除する行数
$Deduction = 0
#$Deduction = 3

#対象ファイルを抽出
$Files = Get-ChildItem $PATH -Filter $Ext -Recurse | Select-Object Name, FullName

# 配列定義
$Datas = @()

foreach ($File in $Files)
{
    # 配列オブジェクトの要素作成
    $Data = New-Object PSObject | Select-Object FullPath, Name, Lines

    $Data.FullPath = Split-Path -Parent $File.FullName
    #Write-Output $Data.FullPath

    $Data.Name = $File.Name
    #Write-Output $Data.Name

    $Data.Lines = (Get-Content $File.FullName | Measure-Object -Line).Lines - $Deduction
    #Write-Output $Data.$Lines

    # 配列に要素を追加
    $Datas += $Data

}

#出力ファイル名
$Name =$PATH + '/filelist_' + (Get-Date).ToString("yyyyMMdd_hhmmss") + '.csv'
#Write-Output $Name

$Datas | Export-Csv -Encoding Default $Name -NoTypeInformation
