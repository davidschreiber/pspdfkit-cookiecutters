package {{cookiecutter.application_id}}

import android.view.Menu
import android.view.MenuItem
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.pspdfkit.document.PdfDocument
import com.pspdfkit.document.providers.AssetDataProvider
import com.pspdfkit.ui.PdfActivity
import com.pspdfkit.ui.PdfActivityIntentBuilder

class LauncherActivity : AppCompatActivity() {
    override fun onStart() {
        super.onStart()

        val intent = PdfActivityIntentBuilder
            .fromDataProvider(this, AssetDataProvider("A.pdf"))
            .activityClass(MyPdfActivity::class)
            .build()
        startActivity(intent)
        finish()
    }
}

class MyPdfActivity : PdfActivity() {
    override fun onDocumentLoaded(document: PdfDocument) {
        // Got a document!
    }

    override fun onGenerateMenuItemIds(menuItems: MutableList<Int>): MutableList<Int> {
        menuItems.add(0, R.id.action_item)
        return super.onGenerateMenuItemIds(menuItems)
    }

    override fun onPrepareOptionsMenu(menu: Menu): Boolean {
        menu.findItem(R.id.action_item).apply {
            setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS)
            title = "Action"
        }
        return super.onPrepareOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        var handled = false

        if (item.itemId == R.id.action_item) {
            Toast.makeText(this, "Action pressed", Toast.LENGTH_SHORT).show()
            handled = true
        }

        return handled || super.onOptionsItemSelected(item)
    }
}