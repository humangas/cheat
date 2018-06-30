#!/bin/bash -u
###########################################################################
# Create index.md under _docs folder
# 
# Usage: You can use it in either of the following ways
# $ make indexmd
# $ bash scripts/indexmd.sh
###########################################################################
DOCS_PATH="_docs"
SITE_PATH="docs"
BASE_URL="https://humangas.github.io/cheat"


header() {
cat << EOS
# INDEX
EOS
}

contents() {
    return
}

index() {
    # setting required: https://squidfunk.github.io/mkdocs-material/extensions/permalinks/#installation

    #$ grep '.*title="\[vim\] リロード.*' vim/index.html
    #  <a href="#vim_2" title="[vim] リロード" class="md-nav__link">
    #  <a href="#vim_2" title="[vim] リロード" class="md-nav__link">
    #
    #$ grep '.*title="\[vim\] リロード.*' vim/index.html | head -1
    #  <a href="#vim_2" title="[vim] リロード" class="md-nav__link">
    #
    #$ grep '.*title="\[vim\] リロード.*' vim/index.html | head -1 | grep -Po '(?<=")[^",]+(?=")'
    ##vim_2
    # title=
    #[vim] リロード
    # class=
    #md-nav__link
    #
    #$ grep '.*title="\[vim\] リロード.*' vim/index.html | head -1 | grep -Po '(?<=")[^",]+(?=")' | head -1
    ##vim_2
    _permalink() {
        _tmp=$(echo "$file_path" | sed -e "s/$DOCS_PATH/$SITE_PATH/")
        indexhtml_path="${_tmp%.*}/index.html"
        index=$(grep ".*title=\".*$title.*\"" $indexhtml_path | head -1 | grep -Po '(?<=")[^",]+(?=")' | head -1)
        echo "- [$title]($BASE_URL/$file/$index)"
    }

    # Contents of variable $l
    # e.g. _docs/shell.md:1:## [shell] あるディレクトリ配下のファイル数をカウントする
    IFS=$'\n'
    for l in $(find $DOCS_PATH -name "*.md" -type f -print0  \
                    | xargs -0 egrep '## \[.*' \
                    | sort); do
        file_path=$(echo "$l" | cut -d: -f1)
        _tmp=$(echo "$file_path" | sed -e "s@$DOCS_PATH/@@")
        file=$(echo ${_tmp%.*})
        
        title=$(echo "$l"  \
            | cut -d: -f2  \
            | sed -e "s/## //"  \
            -e "s/\[.*\] //")

        if [[ $file != $header ]]; then
            echo -e "\n### $file"
        fi
        header=$file

        # echo "- [$title]($BASE_URL/$file)"
        _permalink
    done
}

main() {
    header > "$DOCS_PATH/index.md"
    contents >> "$DOCS_PATH/index.md" 
    index >> "$DOCS_PATH/index.md"
}

main "$@"
