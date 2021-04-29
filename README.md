# Instagram Clone : iOS App using Swift 5 and UIKit
This is a simple instagram iOS app clone, without back-end (Except for auth using Firebase).
I am currently working on adding a back-end.

This project don't use storyboards, and it's all made **programmatically**.

<img src="https://lh3.googleusercontent.com/uQpBqHJbwLW6MiFjNuZvIalYUaPFfV1WmOrXidocPNXGHVKZc8CcLtAYvZSq4lTZHTNDJMpQV8vYpiZU9HTwswqJspIuSsPxuJ-dAab6AxSsR6kH_h1qUYQgyw2GP1wampYFOpYNOuW7ZPCiU0pcvZSbR_fuIgzsIOyILEe8KNLjTlBI6js_04YkKiP9U2SyVc-k75dSgiRfBKX6fMEKrbhrUpJcWfcq0YrfGl2c1y1b6kxLpiZfn_aKXxrFs2HFfzh6RZ8oKQU07gAPDwQes9fSr5K7u59k2naU0Yp1sUZI7wvS5k6-TmlHqf3yNkYF8trx2NP4IxaOm5H7sMLKJQCBqy63_waX0boxywu4sXd1r7VhqhTF6gNRQ6xc15y3nq8Z60dixP0JEwb3RNlpl_31Lj6GL8g1ucekteUGMMGnicRdz9KUQhpK6SYz-_IlPLpuY7bjfrPTFV8q4o5q8aWwFudQQY6H2SR-ivXcGlSFi3dWdXAbna26kUGrYPGgrzTjAzIQWCjy-s2vSRxDEoJgaSJvQ8X_AxMS7Q3sJgATwhB7n1Ltyuk_DqgHVPYF4EC0sdeixviPYcV7ABPWhLt5O0D0_I4PF5DDUVNCo1-jk6ylduCL32hnilQ9Cjf7aWdPOSzQHXrXoBn0aYKtMvlib8mS5MEaNs7Z2jq49e4Lc2U4od4kuKXWaf4LPxncvlvx-HbWM6baPgAdk-K_hC5l=w940-h2030-no?authuser=1" width="200">
<img src="https://lh3.googleusercontent.com/X-D0luEgliYwKxc4sXFYW-shWDxX_wRXWswfZzY4nZi7TdIRxWg7CXJ1NqGSAvZyl0fTsI8BGeUB9xsijNDZk97Yu-MMDKDnj8hy_M4h8VfFRUcBgJ3WOKE5_QyX9UHi-8cZL3A28M_6jWJKEmnGx920PMDakn1pJh3nElsc6RO1lAZEtwbLi3tLQaZYswKkpNKyUGy2ilEAVuWt-xr1ItbO9Quezme_UCsVTeXrcIdolfmkYleo9DPqNYObwbUKQbnHqk3JykHoWk39JizYre0ERJq4YuqdRWM4wsGMB9vrAlUQPcxgM_KBGBUWnSeMDfSVXMUoeiYewrySF-qf4-o81_FMvmowmZA2BntyWtuso2mS3im0lhrxgP-erdI_PfR_akl0kSkLTBOwQCdV1XQ0yYrxd0_vUkGmgh2gpzrhkrQJHs8u1Z8EISwM2dsW2gh9FrZORJfE5E2Z3txwgbqFk5FUuW4T32jpG08L_yW-VS4xMEHaN5Yt93ZzDNE8AeQTibXGu770T_0Z4JCLuiQj4_tals00VKMOSfINS7x_Dk8dIznaWWJUgNf646xqCR0FSu0Qguy025NO2yyXF0StExK-ly3FoFfOVf8PojF-VQHcnskywpUFZRfqnbCjmOMJKQlJKb8-90f8zOXqueCMcLYFhyWWKA9RRj4Gzlez9RY69jAPdNKLuuRIG7N8HsAmtrpRc4rnVWY3qxjqp90S=w940-h2030-no?authuser=1" width="200">
<img src="https://lh3.googleusercontent.com/e-JI-PoiYAo6--YfhmJxDed4jVKOyCKCUyQQbRWAcJhspAjazm1-nxvCqX1cvmFkgijOiHgj9vqn_dwr2_BPupxMf4z5MDfNkcvtB4yp9AdZQHTjMtYu2j95xNH4IkRJB6y_gvbuqXOJ6FyWTik-tmOwVRWV-urtiATP-QvfhCpTcSa7zzAXVdHQ8TGSPdUZn0tVIvSPS-fqmluWOzHKxmF1NpzCvkzM3KooM_lr4VEEfgDpEaXDQ2VUFPNHqcY9nMhlK6ZdPGgu3ipBzH_VoNFixGU1xnQmRiS9EqiktEo3NBrPF3dE-uZ_y5jW8iwIEBgvIbYw9Do-PfMsQbkPOWaLYfL6dtou-g2yP7j-CcxQIHLNDQVZ4BhBDmIjAOHFzpfb_l1ESPyggQr9hMVT9f958fYNejxEYBtMjRyfYHvc-TXG5DiQSzrEj1b7WHyB7E-EileMUmsenWOzgz3H4ikmsj4Oa6OXpxvJIikYNh9w1-9SkMxckGrJ1EHGO40EJpPidipEl8AMO5_VZAXKuT71jMeMBAwRpVXZUClCc1NJMpbP7E2ndBCPk2kzii5EaOZH2AJxlba1T2PvbuA7AhZOrCe7N5DrcR9Vl3FdUNAL01OgDeNxDJBVtb_ShwiZrKdaNFsjFj7mBWPJZZBGIw-W3AD2viGppYamhMYVrwmGSrEOyqCH_1totHElKlb4vDjobQwEM3iCZvsmBRrDkov5=w940-h2030-no?authuser=1" width="200">
<img src="https://lh3.googleusercontent.com/CuTIGTYMZ33rR0h19X2ySl4F91KVR5gVeRAIb9aYyLc13VQQanCI9yjqczpNReUzb_0EHb4oABtyDIW0y8rGlvmXLgS5oB-fCAKkXLd0aaFSZeOJN_kC_QgqGff1ig9KBQMd2k_hG3-7WS8YIFc42cMevh4lB_opI4DEKVlylqUr-l5tjnLC1L4gREMA47by73UnaylzeRMpiLKhC6xBm-Q_KK0_xmsBKyRAPeDlAfkTQ9JsjspGAqxJ7CnorHHp3jpWy6dqijw66hb72fX0gWeM7dJCFZ4dRRuweMmnjtGFDBpQBmradDI0a-9-Qdx_5HmKrGSYpGkR0G7dxhnzwBbG_YikruTVTDdRNYE3XnKhebpfWPqn59rJPaYfhOMGFSX_1saoDj0nOmIP4BjRaGtScu9QUI4_4WXKRGxMYCkdH7yIsnuaF3jbaWjf9-Wzi9WOpz6tyLlQqVuJIBxgPj39N86P8O1-MRh4ANIFAUrnZGcChUG3Ii__S_ShFuJmX9ql72vgYPlk64hVNdoHq1yn62eaLFGQjqc4jl9dkSY16YYxuTeb15C3JyIc6eL9RWkWjIWdCxGWPTDb5tSJXa-Iqu6RNcDXr5k_rEfwJNKH0mktRrvPIr-qYpLNeqFrAS7tCkuzCZzpdyKW_ipimQle5UxpIxE0ovMVx_Vv6hKRReWoyvSraEarZsxk1BwWDtFPIS4_RDtdAkwhttrcxaOz=w940-h2030-no?authuser=1" width="200">
<img src="https://lh3.googleusercontent.com/2Anhxmc4CkRPTT4wJM1TQdGDQWJvCR4mvezZ093f8Bhc78UeWlJXWTgze-pwnfNtnZ2FPPgAexu8mSV6R6ICHRy9f_MtHglpxdYMYb87SULUXCecyEpcf2zRai4Dc_IQcKv0kaeVAGEAhjOsdVE2uq2-HcpF3ILtOWIA7G42zk6ukGbLneMDUd5R5FDXMPhVmUA4hQEA9lCxXKf_0q2ro5BFForsB78n6RwoCOjjFayUS_P5mmirPu-AKcw5I2IuTu3URK9Zs40W7Sh9BARpBEOyGZ00a9dv43_hzmnsrPnu5IeIXqQHVURXCtzAvon9M20NG0xUrbVOFk-hPZSKJn0s4QgB_Z_GJ-Bwfz687AvYEaGsyHe_tzoPl18MTEB2O266Adi1Q5xSUQzFUQbWFn3PxcwyhkakvlgeMiViNpnVGQ-diOBjEBgY2NdGDE4sBSYHd1n1a55o7-PlbodIpkuY1BgRE93I_wj23hkH4S7cIxZZ-DH2TJeVCXRC_5ZTDrdD8pL8StB8Al1oHHb1ldm0ZellzIBX5WyJeQA6hp27ejK6s_Tx98OTQ9OOxgrQrVO8IekrZ_nHGo1VvZilhsgs82PN7fzt0O4MIg7OPM5A3ZSXG2jE2icVORUstn6rlHIq_rcVrk3-uQwY5f5vtMP8ZKVBpe2D1cVKbnmFd1PvEnW7Xg7cVKAmqnjm9Mp6rgkWZrLgfz1rizuJ0JohbP96=w940-h2030-no?authuser=1" width="200">