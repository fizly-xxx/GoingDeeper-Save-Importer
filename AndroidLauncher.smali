.class public Lcom/kirill_skibin/going_deeper/AndroidLauncher;
.super Lcom/badlogic/gdx/backends/android/AndroidApplication;
.source "AndroidLauncher.java"


# instance fields
.field u:Lh1/i;
# static fields
.field public static myActivity:Lcom/kirill_skibin/going_deeper/AndroidLauncher;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/badlogic/gdx/backends/android/AndroidApplication;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/badlogic/gdx/backends/android/AndroidApplication;->onActivityResult(IILandroid/content/Intent;)V

    # Handle custom save import request
    const-string v0, "GD_HACK"
    const-string v1, "--- onActivityResult Triggered ---"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x270f
    if-ne p1, v0, :cond_custom_skip

    const-string v0, "GD_HACK"
    const-string v1, "Step 1: Code 9999 Matched!"
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, -0x1
    if-ne p2, v0, :cond_custom_bad_result

    if-nez p3, :cond_custom_proceed
    const-string v0, "GD_HACK"
    const-string v1, "Error: Intent data is NULL!"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    goto/16 :cond_custom_done

    :cond_custom_bad_result
    const-string v0, "GD_HACK"
    const-string v1, "Error: Result was not RESULT_OK (-1)"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    goto/16 :cond_custom_done

    :cond_custom_proceed
    :try_start_0
    const-string v0, "GD_HACK"
    const-string v1, "Step 2: Processing file..."
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v0

    const-string v1, "su_sa_ca.bin"

    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v2
    move-object v3, v0
    const/4 v4, 0x0
    move-object v5, v4
    move-object v6, v4
    move-object v7, v4
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    move-result-object v3

    if-eqz v3, :cond_cursor_done
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z
    move-result v4
    if-eqz v4, :cond_cursor_close
    const-string v4, "_display_name"
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I
    move-result v4
    const/4 v5, -0x1
    if-eq v4, v5, :cond_cursor_close
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v1
    :cond_cursor_close
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :cond_cursor_done

    invoke-virtual {v2, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    move-result-object v0

    new-instance v2, Ljava/io/File;
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;
    move-result-object v3
    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v2, 0x400
    new-array v2, v2, [B
    :loop_read
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I
    move-result v4
    const/4 v5, -0x1
    if-eq v4, v5, :cond_loop_end
    const/4 v5, 0x0
    invoke-virtual {v3, v2, v5, v4}, Ljava/io/FileOutputStream;->write([BII)V
    goto :loop_read
    :cond_loop_end
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    const-string v0, "GD_HACK"
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "SUCCESS! File saved as: "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    goto :cond_custom_done

    :catch_0
    move-exception v0
    const-string v1, "GD_HACK"
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    
    goto :cond_custom_done

    :cond_custom_skip
    # Handle original Google Sign-In request
    const/4 p2, 0x7

    if-ne p1, p2, :cond_4

    sget-object p1, Lp0/a;->j:Ls0/a;
    invoke-interface {p1, p3}, Ls0/a;->a(Landroid/content/Intent;)Ls0/b;
    move-result-object p1

    const p2, 0x104000a
    const-string p3, "Sign in error"
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ls0/b;->c()Z
    move-result v1

    if-eqz v1, :cond_0

    iget-object p2, p0, Lcom/kirill_skibin/going_deeper/AndroidLauncher;->u:Lh1/i;
    invoke-virtual {p1}, Ls0/b;->a()Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;
    move-result-object p1
    invoke-virtual {p2, p1}, Lh1/i;->m(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/kirill_skibin/going_deeper/AndroidLauncher;->u:Lh1/i;
    invoke-virtual {v1, v0}, Lh1/i;->m(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    invoke-virtual {p1}, Ls0/b;->b()Lcom/google/android/gms/common/api/Status;
    move-result-object p1
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->R()Ljava/lang/String;
    move-result-object p1

    if-eqz p1, :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :cond_1
    goto :goto_0
    :cond_1
    move-object p3, p1

    :cond_2
    :goto_0
    new-instance p1, Landroid/app/AlertDialog$Builder;
    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object p1
    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object p1
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    goto :goto_1

    :cond_3
    new-instance p1, Landroid/app/AlertDialog$Builder;
    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V
    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object p1
    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object p1
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_4
    :goto_1
    :cond_custom_done
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    # Initialize static activity reference
    sput-object p0, Lcom/kirill_skibin/going_deeper/AndroidLauncher;->myActivity:Lcom/kirill_skibin/going_deeper/AndroidLauncher;

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, LA/d;

    .line 9
    .line 10
    invoke-direct {v0}, LA/d;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-boolean p1, v0, LA/d;->k:Z

    .line 14
    .line 15
    iput-boolean p1, v0, LA/d;->i:Z

    .line 16
    .line 17
    iput-boolean p1, v0, LA/d;->j:Z

    .line 18
    .line 19
    iput p1, v0, LA/d;->g:I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    iput-boolean v1, v0, LA/d;->s:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "android_id"

    .line 29
    .line 30
    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Lj1/k;->f()Lj1/k;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v1}, Lj1/k;->h(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-static {}, Lj1/k;->f()Lj1/k;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Lh1/e;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Lh1/e;-><init>(Lcom/kirill_skibin/going_deeper/AndroidLauncher;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lj1/k;->i(Lj1/j;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lj1/i;->f()Lj1/i;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Lh1/h;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Lh1/h;-><init>(Lcom/kirill_skibin/going_deeper/AndroidLauncher;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v2}, Lj1/i;->x(Lj1/l;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lj1/b;->a()Lj1/b;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    new-instance v2, Lh1/a;

    .line 72
    .line 73
    invoke-direct {v2, p0}, Lh1/a;-><init>(Lcom/kirill_skibin/going_deeper/AndroidLauncher;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lj1/b;->c(Lj1/a;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lj1/d;->b()Lj1/d;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    new-instance v2, Lh1/d;

    .line 84
    .line 85
    invoke-direct {v2, p0}, Lh1/d;-><init>(Lcom/kirill_skibin/going_deeper/AndroidLauncher;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lj1/d;->c(Lj1/c;)V

    .line 89
    .line 90
    .line 91
    new-instance v1, Lh1/i;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Lh1/i;-><init>(Lcom/kirill_skibin/going_deeper/AndroidLauncher;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/kirill_skibin/going_deeper/AndroidLauncher;->u:Lh1/i;

    .line 97
    .line 98
    invoke-static {}, Lj1/o;->a()Lj1/o;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v2, p0, Lcom/kirill_skibin/going_deeper/AndroidLauncher;->u:Lh1/i;

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Lj1/o;->g(Lj1/n;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/ironsource/adqualitysdk/sdk/IronSourceAdQuality;->getInstance()Lcom/ironsource/adqualitysdk/sdk/IronSourceAdQuality;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const-string v2, "ec0e65e9"

    .line 112
    .line 113
    invoke-virtual {v1, p0, v2}, Lcom/ironsource/adqualitysdk/sdk/IronSourceAdQuality;->initialize(Landroid/content/Context;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    new-instance v1, Lcom/kirill_skibin/going_deeper/b;

    .line 117
    .line 118
    sget-object v2, Lcom/kirill_skibin/going_deeper/b$c;->b:Lcom/kirill_skibin/going_deeper/b$c;

    .line 119
    .line 120
    invoke-direct {v1, v2, p1}, Lcom/kirill_skibin/going_deeper/b;-><init>(Lcom/kirill_skibin/going_deeper/b$c;Z)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/backends/android/AndroidApplication;->H(Lv/d;LA/d;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/badlogic/gdx/backends/android/AndroidApplication;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/ironsource/mediationsdk/IronSource;->onPause(Landroid/app/Activity;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/badlogic/gdx/backends/android/AndroidApplication;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/ironsource/mediationsdk/IronSource;->onResume(Landroid/app/Activity;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidApplication;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/16 v0, 0xf06

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method