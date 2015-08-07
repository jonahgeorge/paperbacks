$("#book-search").on "keydown", (event) ->
  setTimeout(=>
    $.getJSON "/books.json?title=" + $(this).val(), (books) ->

      $("#book-search-results").html ""

      books.forEach (book) ->
        $("#book-search-results").append "
          <div class='flex-item'>
            <input type='radio' id='book_radio_" + book.id + "'
              name='listing[book_id]' value='" + book.id + "' class='hidden'>
            <label for='book_radio_" + book.id + "'>
              <img class='artwork' src='http://placehold.it/100x150'>
              <p class='title'>" + book.title + "</p>
            </label>
          </div>
          "
  , 250)
